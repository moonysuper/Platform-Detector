package com.plusStudio.platform_detector

import android.content.Intent
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

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
}
