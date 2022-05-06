package com.siiprinter.sii_printer_plugin

/**
 * Implement items in the device list.
 */
class DeviceListItem {
    /** device name  */
    val name: String

    /** device mac address  */
    val macAddress: String

    /** device ip address  */
    val ipAddress: String

    /**
     * constructor
     *
     * @param deviceName
     * @param deviceAddress
     */
    constructor(
        deviceName: String,
        deviceAddress: String
    ) {
        name = deviceName
        macAddress = deviceAddress
        ipAddress = ""
    }

    /**
     * constructor
     *
     * @param deviceName
     * @param macAddress
     * @param ipAddress
     */
    constructor(
        deviceName: String,
        macAddress: String,
        ipAddress: String
    ) {
        name = deviceName
        this.macAddress = macAddress
        this.ipAddress = ipAddress
    }

    fun toMap(): HashMap<String, Any> {
        return hashMapOf(
            "device_name" to name,
            "mac_address" to macAddress,
            "ip_address" to ipAddress
        )
    }
}