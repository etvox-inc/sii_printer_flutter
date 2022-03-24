package com.siiprinter.sii_printer_plugin;


/**
 * Implement items in the device list.
 */
public class DeviceListItem {

    /** device name */
    private final String mDeviceName;

    /** device mac address */
    private final String mDeviceMacAddress;

    /** device ip address */
    private final String mDeviceIpAddress;


    /**
     * constructor
     *
     * @param deviceName
     * @param deviceAddress
     */
    public DeviceListItem(
            final String deviceName,
            final String deviceAddress
    ) {

        mDeviceName = deviceName;
        mDeviceMacAddress = deviceAddress;
        mDeviceIpAddress = "";
    }


    /**
     * constructor
     *
     * @param deviceName
     * @param macAddress
     * @param ipAddress
     */
    public DeviceListItem(
            final String deviceName,
            final String macAddress,
            final String ipAddress
    ) {

        mDeviceName = deviceName;
        mDeviceMacAddress = macAddress;
        mDeviceIpAddress = ipAddress;
    }


    public String getName() {
        return mDeviceName;
    }


    public String getMacAddress() {
        return mDeviceMacAddress;
    }


    public String getIpAddress() {
        return mDeviceIpAddress;
    }

}
