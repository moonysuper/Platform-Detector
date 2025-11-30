package com.plusStudio.platform_detector

import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.zip.ZipFile

class MainActivity : FlutterActivity() {
    private val channelName = "platform_detector/methods"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "shareApk" -> {
                    val packageName = call.argument<String>("package_name")
                    if (shareApk(packageName)) {
                        result.success(true)
                    } else {
                        result.error("EXPORT_FAILED", "Unable to export APK", null)
                    }
                }

                "detectPlatform" -> {
                    val packageName = call.argument<String>("package_name")
                    if (packageName.isNullOrBlank()) {
                        result.error("INVALID_ARGUMENT", "Package name is required", null)
                    } else {
                        val platform = detectAppPlatform(packageName)
                        result.success(platform)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun shareApk(packageName: String?): Boolean {
        val apkFile = exportApk(packageName) ?: return false
        val uri = FileProvider.getUriForFile(
            this,
            "${applicationContext.packageName}.fileprovider",
            apkFile
        )
        val shareIntent = Intent(Intent.ACTION_SEND).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK
            putExtra(Intent.EXTRA_STREAM, uri)
            type = "application/vnd.android.package-archive"
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivity(Intent.createChooser(shareIntent, "Share APK"))
        return true
    }

    private fun exportApk(packageName: String?): File? {
        if (packageName.isNullOrBlank()) return null
        return try {
            val appInfo = packageManager.getApplicationInfo(packageName, 0)
            val source = File(appInfo.sourceDir)
            val target = File(cacheDir, "${appInfo.packageName}_${System.currentTimeMillis()}.apk")
            if (target.exists()) target.delete()
            source.copyTo(target, overwrite = true)
            target
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    /**
     * Detects the development platform of an installed app by analyzing its APK structure
     * Returns: "flutter", "react_native", "xamarin", "ionic", "unity", "kotlin", "java", "native", "unknown"
     */
    private fun detectAppPlatform(packageName: String): String {
        return try {
            val appInfo = packageManager.getApplicationInfo(packageName, 0)
            val apkPath = appInfo.sourceDir
            
            // Analyze APK contents
            ZipFile(apkPath).use { zip ->
                val entries = zip.entries().toList().map { it.name }
                
                // Check for Flutter
                if (entries.any { it.contains("libflutter.so") || it.contains("flutter_assets") }) {
                    return "flutter"
                }
                
                // Check for React Native
                if (entries.any { it.contains("libreactnativejni.so") || 
                                  it.contains("libjscexecutor.so") ||
                                  it.contains("libhermes.so") ||
                                  it.contains("libreact_nativemodule_core.so") }) {
                    return "react_native"
                }
                
                // Check for Xamarin
                if (entries.any { it.contains("libmonodroid.so") || 
                                  it.contains("libmonosgen-2.0.so") ||
                                  it.contains("libxamarin-app.so") ||
                                  it.contains("assemblies/") }) {
                    return "xamarin"
                }
                
                // Check for Ionic/Cordova
                if (entries.any { it.contains("cordova.js") || 
                                  it.contains("cordova_plugins.js") ||
                                  it.contains("www/cordova") }) {
                    return "ionic"
                }
                
                // Check for Unity
                if (entries.any { it.contains("libunity.so") || 
                                  it.contains("libmain.so") && it.contains("lib/") }) {
                    return "unity"
                }
                
                // Check for Kotlin vs Java
                val hasKotlin = entries.any { it.contains("kotlin/") || it.endsWith(".kotlin_module") }
                val hasDex = entries.any { it.endsWith(".dex") }
                
                if (hasKotlin) {
                    return "kotlin"
                }
                
                if (hasDex) {
                    // It's a native Android app (Java/Kotlin) but we couldn't find Kotlin markers
                    return "java"
                }
                
                return "native"
            }
        } catch (e: Exception) {
            e.printStackTrace()
            "unknown"
        }
    }
}
