package com.example.data_wedge_demo

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log

class DWInterface {
    companion object {
        const val EXTRA_CREATE_PROFILE = "com.symbol.datawedge.api.CREATE_PROFILE"
        const val EXTRA_GET_PROFILES = "com.symbol.datawedge.api.GET_PROFILES_LIST"
        const val EXTRA_ACTIVE_PROFILE = "com.symbol.datawedge.api.GET_ACTIVE_PROFILE"
        const val EXTRA_KEY_APPLICATION_NAME = "com.symbol.datawedge.api.APPLICATION_NAME"
        const val EXTRA_KEY_NOTIFICATION_TYPE = "com.symbol.datawedge.api.NOTIFICATION_TYPE"
        const val EXTRA_RESULT_NOTIFICATION = "com.symbol.datawedge.api.NOTIFICATION"
        const val EXTRA_REGISTER_NOTIFICATION = "com.symbol.datawedge.api.REGISTER_FOR_NOTIFICATION"

        const val EXTRA_RESULT_NOTIFICATION_TYPE = "NOTIFICATION_TYPE"
        const val EXTRA_KEY_VALUE_SCANNER_STATUS = "SCANNER_STATUS"
        const val EXTRA_KEY_VALUE_PROFILE_SWITCH = "PROFILE_SWITCH"
        const val EXTRA_KEY_VALUE_PROFILE_ENABLED = "PROFILE_ENABLED"
        const val EXTRA_KEY_VALUE_CONFIGURATION_UPDATE = "CONFIGURATION_UPDATE"
        const val EXTRA_KEY_VALUE_NOTIFICATION_STATUS = "STATUS"
        const val EXTRA_KEY_VALUE_NOTIFICATION_PROFILE_NAME = "PROFILE_NAME"
        const val EXTRA_SEND_RESULT = "SEND_RESULT"

        const val EXTRA_RESULT = "RESULT"
        const val EXTRA_RESULT_GET_ACTIVE_PROFILE =
            "com.symbol.datawedge.api.RESULT_GET_ACTIVE_PROFILE"
        const val EXTRA_RESULT_GET_PROFILES_LIST =
            "com.symbol.datawedge.api.RESULT_GET_PROFILES_LIST"
        const val EXTRA_RESULT_INFO = "RESULT_INFO"
        const val EXTRA_COMMAND = "COMMAND"
        const val EXTRA_COMMAND_IDENTIFIER = "COMMAND_IDENTIFIER"

        // DataWedge Actions
        const val ACTION_DATAWEDGE = "com.symbol.datawedge.api.ACTION"
        const val ACTION_RESULT_NOTIFICATION = "com.symbol.datawedge.api.NOTIFICATION_ACTION"
        const val ACTION_RESULT = "com.symbol.datawedge.api.RESULT_ACTION"

        const val ACTION_SET_CONFIG = "com.symbol.datawedge.api.SET_CONFIG"

        const val DATAWEDGE_SCAN_EXTRA_SOURCE = "com.symbol.datawedge.source"
        const val DATAWEDGE_SCAN_EXTRA_DATA_STRING = "com.symbol.datawedge.data_string"
        const val DATAWEDGE_SCAN_EXTRA_LABEL_TYPE = "com.symbol.datawedge.label_type"

    }

    fun sendCommandString(
        context: Context,
        command: String,
        parameter: String,
        commandIdentifier: String,
    ) {
        val dwIntent = Intent()
        dwIntent.action = ACTION_DATAWEDGE
        dwIntent.putExtra(command, parameter)
        dwIntent.putExtra(EXTRA_SEND_RESULT, "true")
        dwIntent.putExtra(EXTRA_COMMAND_IDENTIFIER, commandIdentifier)
        context.sendBroadcast(dwIntent)
    }

    fun sendCommandBundle(
        context: Context,
        command: String,
        parameter: Bundle,
        commandIdentifier: String,
    ) {
        val dwIntent = Intent()
        dwIntent.action = ACTION_DATAWEDGE
        dwIntent.putExtra(command, parameter)
        dwIntent.putExtra(EXTRA_SEND_RESULT, "true")
        dwIntent.putExtra(EXTRA_COMMAND_IDENTIFIER, commandIdentifier)
        context.sendBroadcast(dwIntent)
    }
}