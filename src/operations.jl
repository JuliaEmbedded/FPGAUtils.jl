
export get_fpga_name, get_fpga_state

"""
    get_fpga_name(; device="fpga0" )

Get the name of the FPGA mounted as `device`.
"""
function get_fpga_name(; device="fpga0" )
    is_valid_device( device )

    return readchomp( "$kmod_class_dir/$device/name" )
end


"""
    get_fpga_state(; device="fpga0 )

Get the current state of the FPGA mounted as `device`.
"""
function get_fpga_state(; device="fpga0" )
    is_valid_device( device )

    state = readchomp( "$kmod_class_dir/$device/state" )

    return StatusFromStrings[ state ]
end
