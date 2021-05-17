
# Flags used to configure the FPGA manager when writing an image
# These are from include/linux/fpga/fpga-mgr.h
@enum FPGAFlags begin
    # Reconfigure the entire FPGA
    FPGA_FULL_RECONFIG        = 0

    # Do partial reconfiguration of the FPGA, if supported
    FPGA_PARTIAL_RECONFIG     = 1

    # FPGA has been configured prior to Linux booting
    FPGA_EXTERNAL_CONFIG      = 2

    # The bitstream is encrypted
    FPGA_ENCRYPTED_BITSTREAM  = 4

    # The SPI bitstream bit order is LSB first
    FPGA_BITSTREAM_LSB_FIRST  = 8

    # The FPGA bitstream is compressed
    FPGA_COMPRESSED_BITSTREAM = 16
end

@enum FPGAStates begin
    # Can't determine the state
    FPGA_STATE_UNKNOWN

    # The FPGA is powered off
    FPGA_STATE_POWER_OFF

    # The FPGA is powered up
    FPGA_STATE_POWER_UP

    # The FPGA is in the reset state
    FPGA_STATE_RESET

    # There is a firmware request in progress
    FPGA_STATE_FIRMWARE_REQ

    # There was an error with the firmware request
    FPGA_STATE_FIRMWARE_REQ_ERR

    # Preparing the FPGA for prgramming
    FPGA_STATE_WRITE_INIT

    # There was an error preparing the FPGA for programming
    FPGA_STATE_WRITE_INIT_ERR

    # Writing the bitstream image to the FPGA
    FPGA_STATE_WRITE

    # There was an error writing the bitstream image to the FPGAStates
    FPGA_STATE_WRITE_ERR

    # The FPGA is doing post-writing operations
    FPGA_STATE_WRITE_COMPLETE

    # There was an error while performing post-writing tasks
    FPGA_STATE_WRITE_COMPLETE_ERR

    # The FPGA is programmed and operating
    FPGA_STATE_OPERATING
end

# These are the strings that will be returned by the `state` sys file
const StateFromStrings = Dict{String, FPGAStates}(
    "unknown" => FPGA_STATE_UNKNOWN,
    "power off" => FPGA_STATE_POWER_OFF,
    "power up" => FPGA_STATE_POWER_UP,
    "reset" => FPGA_STATE_RESET,
    "firmware request" => FPGA_STATE_FIRMWARE_REQ,
    "firmware request error" => FPGA_STATE_FIRMWARE_REQ_ERR,
    "write init" => FPGA_STATE_WRITE_INIT,
    "write init error" => FPGA_STATE_WRITE_INIT_ERR,
    "write" => FPGA_STATE_WRITE,
    "write error" => FPGA_STATE_WRITE_ERR,
    "write complete" => FPGA_STATE_WRITE_COMPLETE,
    "write complete error" => FPGA_STATE_WRITE_COMPLETE_ERR,
    "operating" => FPGA_STATE_OPERATING,
    )

# Errors that could happen during full/partial reconfiguration
# Technically, more than one could happen
@enum FPGAStatus begin
    FPGA_STATUS_OPERATION_ERR
    FPGA_STATUS_CRC_ERR
    FPGA_STATUS_INCOMPATIBLE_IMAGE_ERR
    FPGA_STATUS_IP_PROTOCOL_ERR
    FPGA_STATUS_FIFO_OVERFLOW_ERR
end

# These are the strings that will be returned by the `status` sys file
const StatusFromStrings = Dict{String, FPGAStatus}(
    "reconfig operation error" => FPGA_STATUS_OPERATION_ERR,
    "reconfig CRC error" => FPGA_STATUS_CRC_ERR,
    "reconfig incompatible image" => FPGA_STATUS_INCOMPATIBLE_IMAGE_ERR,
    "reconfig IP protocol error" => FPGA_STATUS_IP_PROTOCOL_ERR,
    "reconfig fifo overflow error" => FPGA_STATUS_FIFO_OVERFLOW_ERR
    )
