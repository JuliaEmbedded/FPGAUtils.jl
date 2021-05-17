module FPGAUtils


function _is_kmod_loaded()
    # Throw an error if the module won't work on the system
    @static if Sys.iswindows() || Sys.isapple()
        error( "FPGAUtils only supports linux systems" )
    else
        isdir( "/sys/class/fpga_manager" ) || error( "fpga_manager kernel module is not loaded" )
    end
end

"""
    is_valid_device( device )

Test to see if `device` is a valid FPGA device loaded by the fpga_mapper kernel module.
"""
function is_valid_device( device )
    _is_kmod_loaded()
    isdir( "/sys/class/fpga_manager/$device" ) || error( "Device $device does not exist" )
end


const kmod_class_dir = "/sys/class/fpga_manager"

include( "constants.jl" )
include( "operations.jl" )

end
