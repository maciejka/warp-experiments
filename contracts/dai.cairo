%lang starknet

from evm.array import validate_array
from evm.calls import calldataload, calldatasize, caller
from evm.exec_env import ExecutionEnvironment
from evm.hashing import uint256_pedersen
from evm.memory import uint256_mload, uint256_mstore
from evm.uint256 import is_eq, is_gt, is_lt, is_zero, slt, u256_add, u256_shr
from evm.yul_api import address, log2, log3, warp_return
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.default_dict import default_dict_finalize, default_dict_new
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.uint256 import (
    Uint256, uint256_and, uint256_not, uint256_or, uint256_sub)

func __warp_identity_Uint256(arg0 : Uint256) -> (arg0 : Uint256):
    return (arg0)
end

func __warp_constant_0() -> (res : Uint256):
    return (Uint256(low=0, high=0))
end

func sstore{pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        key : Uint256, value : Uint256):
    evm_storage.write(key, value)
    return ()
end

func sload{pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(key : Uint256) -> (
        value : Uint256):
    let (value) = evm_storage.read(key)
    return (value)
end

@storage_var
func evm_storage(arg0 : Uint256) -> (res : Uint256):
end

@constructor
func constructor{
        bitwise_ptr : BitwiseBuiltin*, pedersen_ptr : HashBuiltin*, range_check_ptr,
        syscall_ptr : felt*}(calldata_size, calldata_len, calldata : felt*):
    alloc_locals
    validate_array(calldata_size, calldata_len, calldata)
    let (memory_dict) = default_dict_new(0)
    let memory_dict_start = memory_dict
    let msize = 0
    with memory_dict, msize:
        __constructor_meat()
    end
    default_dict_finalize(memory_dict_start, memory_dict, 0)
    return ()
end

@external
func __main{
        bitwise_ptr : BitwiseBuiltin*, pedersen_ptr : HashBuiltin*, range_check_ptr,
        syscall_ptr : felt*}(calldata_size, calldata_len, calldata : felt*) -> (
        returndata_size, returndata_len, returndata : felt*):
    alloc_locals
    validate_array(calldata_size, calldata_len, calldata)
    let (__fp__, _) = get_fp_and_pc()
    local exec_env_ : ExecutionEnvironment = ExecutionEnvironment(calldata_size=calldata_size, calldata_len=calldata_len, calldata=calldata, returndata_size=0, returndata_len=0, returndata=cast(0, felt*), to_returndata_size=0, to_returndata_len=0, to_returndata=cast(0, felt*))
    let exec_env : ExecutionEnvironment* = &exec_env_
    let (memory_dict) = default_dict_new(0)
    let memory_dict_start = memory_dict
    let msize = 0
    let termination_token = 0
    with exec_env, memory_dict, msize, termination_token:
        __main_meat()
    end
    default_dict_finalize(memory_dict_start, memory_dict, 0)
    return (exec_env.to_returndata_size, exec_env.to_returndata_len, exec_env.to_returndata)
end

func __constructor_meat{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}() -> ():
    alloc_locals
    let (_1 : Uint256) = __warp_identity_Uint256(Uint256(low=128, high=0))
    uint256_mstore(offset=Uint256(low=64, high=0), value=_1)
    let (__warp_subexpr_0 : Uint256) = __warp_constant_0()
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (__warp_subexpr_1 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_1)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_2 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_2, value=Uint256(low=1, high=0))
    let (__warp_subexpr_3 : Uint256) = caller()
    log2(
        _1,
        Uint256(low=0, high=0),
        Uint256(low=223900192535450488218712201491897670240, high=293833134190415102004153989462159305800),
        __warp_subexpr_3)
    return ()
end

func abi_decode{range_check_ptr}(dataEnd : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = u256_add(
        dataEnd,
        Uint256(low=340282366920938463463374607431768211452, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_0 : Uint256) = slt(__warp_subexpr_1, Uint256(low=0, high=0))
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func copy_literal_to_memory_0b1461ddc0c1d5ded79a1db0f74dae949050a7c0b28728c724b24958c27a328b{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}() -> (
        memPtr : Uint256):
    alloc_locals
    let (memPtr_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (newFreePtr : Uint256) = u256_add(memPtr_1, Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = is_lt(newFreePtr, memPtr_1)
    let (__warp_subexpr_1 : Uint256) = is_gt(newFreePtr, Uint256(low=18446744073709551615, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_or(__warp_subexpr_1, __warp_subexpr_2)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    uint256_mstore(offset=Uint256(low=64, high=0), value=newFreePtr)
    uint256_mstore(offset=memPtr_1, value=Uint256(low=14, high=0))
    let memPtr : Uint256 = memPtr_1
    let (__warp_subexpr_3 : Uint256) = u256_add(memPtr_1, Uint256(low=32, high=0))
    uint256_mstore(
        offset=__warp_subexpr_3, value=Uint256(low=0, high=90893288722789692614667109424239083520))
    return (memPtr)
end

func __warp_loop_body_0{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}(
        _1 : Uint256, headStart : Uint256, i : Uint256, value0 : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_4 : Uint256) = u256_add(value0, i)
    let (__warp_subexpr_3 : Uint256) = u256_add(__warp_subexpr_4, _1)
    let (__warp_subexpr_2 : Uint256) = u256_add(headStart, i)
    let (__warp_subexpr_1 : Uint256) = uint256_mload(__warp_subexpr_3)
    let (__warp_subexpr_0 : Uint256) = u256_add(__warp_subexpr_2, Uint256(low=64, high=0))
    uint256_mstore(offset=__warp_subexpr_0, value=__warp_subexpr_1)
    return ()
end

func __warp_loop_0{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}(
        _1 : Uint256, headStart : Uint256, i : Uint256, length : Uint256, value0 : Uint256) -> (
        i : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = is_lt(i, length)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        return (i)
    end
    __warp_loop_body_0(_1, headStart, i, value0)
    let (i : Uint256) = u256_add(i, _1)
    let (i : Uint256) = __warp_loop_0(_1, headStart, i, length, value0)
    return (i)
end

func __warp_block_0{memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart : Uint256, length : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = u256_add(headStart, length)
    let (__warp_subexpr_0 : Uint256) = u256_add(__warp_subexpr_1, Uint256(low=64, high=0))
    uint256_mstore(offset=__warp_subexpr_0, value=Uint256(low=0, high=0))
    return ()
end

func __warp_if_0{memory_dict : DictAccess*, msize, range_check_ptr}(
        __warp_subexpr_1 : Uint256, headStart : Uint256, length : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_1.low + __warp_subexpr_1.high != 0:
        __warp_block_0(headStart, length)
        return ()
    else:
        return ()
    end
end

func abi_encode_string{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart : Uint256, value0 : Uint256) -> (tail : Uint256):
    alloc_locals
    uint256_mstore(offset=headStart, value=Uint256(low=32, high=0))
    let (length : Uint256) = uint256_mload(value0)
    let (__warp_subexpr_0 : Uint256) = u256_add(headStart, Uint256(low=32, high=0))
    uint256_mstore(offset=__warp_subexpr_0, value=length)
    let i : Uint256 = Uint256(low=0, high=0)
    let (i : Uint256) = __warp_loop_0(Uint256(low=32, high=0), headStart, i, length, value0)
    let (__warp_subexpr_1 : Uint256) = is_gt(i, length)
    __warp_if_0(__warp_subexpr_1, headStart, length)
    let (__warp_subexpr_4 : Uint256) = u256_add(length, Uint256(low=31, high=0))
    let (__warp_subexpr_3 : Uint256) = uint256_and(
        __warp_subexpr_4,
        Uint256(low=340282366920938463463374607431768211424, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_2 : Uint256) = u256_add(headStart, __warp_subexpr_3)
    let (tail : Uint256) = u256_add(__warp_subexpr_2, Uint256(low=64, high=0))
    return (tail)
end

func abi_decode_addresst_uint256{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, range_check_ptr}(
        dataEnd : Uint256) -> (value0 : Uint256, value1 : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = u256_add(
        dataEnd,
        Uint256(low=340282366920938463463374607431768211452, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_0 : Uint256) = slt(__warp_subexpr_1, Uint256(low=64, high=0))
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (value0 : Uint256) = calldataload(Uint256(low=4, high=0))
    let (value1 : Uint256) = calldataload(Uint256(low=36, high=0))
    return (value0, value1)
end

func fun_approve{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_spender : Uint256, var_value : Uint256) -> (var : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_spender)
    uint256_mstore(offset=Uint256(low=32, high=0), value=dataSlot)
    let (__warp_subexpr_1 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_1, value=var_value)
    let (_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    uint256_mstore(offset=_1, value=var_value)
    let (__warp_subexpr_2 : Uint256) = caller()
    log3(
        _1,
        Uint256(low=32, high=0),
        Uint256(low=293775384895699468565546264665434339621, high=186569000182439804704099571914554377459),
        __warp_subexpr_2,
        var_spender)
    let var : Uint256 = Uint256(low=1, high=0)
    return (var)
end

func abi_encode_bool{memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart : Uint256, value0 : Uint256) -> (tail : Uint256):
    alloc_locals
    let (tail : Uint256) = u256_add(headStart, Uint256(low=32, high=0))
    let (__warp_subexpr_1 : Uint256) = is_zero(value0)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    uint256_mstore(offset=headStart, value=__warp_subexpr_0)
    return (tail)
end

func abi_encode_uint256{memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart : Uint256, value0 : Uint256) -> (tail : Uint256):
    alloc_locals
    let (tail : Uint256) = u256_add(headStart, Uint256(low=32, high=0))
    uint256_mstore(offset=headStart, value=value0)
    return (tail)
end

func abi_decode_addresst_addresst_uint256{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, range_check_ptr}(
        dataEnd : Uint256) -> (value0 : Uint256, value1 : Uint256, value2 : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = u256_add(
        dataEnd,
        Uint256(low=340282366920938463463374607431768211452, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_0 : Uint256) = slt(__warp_subexpr_1, Uint256(low=96, high=0))
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (value0 : Uint256) = calldataload(Uint256(low=4, high=0))
    let (value1 : Uint256) = calldataload(Uint256(low=36, high=0))
    let (value2 : Uint256) = calldataload(Uint256(low=68, high=0))
    return (value0, value1, value2)
end

func require_helper_stringliteral_d9f1{range_check_ptr}(condition : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(condition)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func mapping_index_access_mapping_address_uint256_of_address_2932{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr}(key : Uint256) -> (dataSlot : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    return (dataSlot)
end

func require_helper_stringliteral_81d4{range_check_ptr}(condition : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(condition)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func mapping_index_access_mapping_address_uint256_of_address_2934{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr}(key : Uint256) -> (dataSlot : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    return (dataSlot)
end

func mapping_index_access_mapping_address_uint256_of_address{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr}(slot : Uint256, key : Uint256) -> (
        dataSlot : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=slot)
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    return (dataSlot)
end

func require_helper_stringliteral_dc58{range_check_ptr}(condition : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(condition)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func checked_sub_uint256{range_check_ptr}(x : Uint256, y : Uint256) -> (diff : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_lt(x, y)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (diff : Uint256) = uint256_sub(x, y)
    return (diff)
end

func checked_add_uint256{range_check_ptr}(x : Uint256, y : Uint256) -> (sum : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = uint256_not(y)
    let (__warp_subexpr_0 : Uint256) = is_gt(x, __warp_subexpr_1)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (sum : Uint256) = u256_add(x, y)
    return (sum)
end

func __warp_block_1{range_check_ptr, syscall_ptr : felt*}(var_to : Uint256) -> (expr : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = address()
    let (__warp_subexpr_0 : Uint256) = is_eq(var_to, __warp_subexpr_1)
    let (expr : Uint256) = is_zero(__warp_subexpr_0)
    return (expr)
end

func __warp_if_1{range_check_ptr, syscall_ptr : felt*}(expr : Uint256, var_to : Uint256) -> (
        expr : Uint256):
    alloc_locals
    if expr.low + expr.high != 0:
        let (expr : Uint256) = __warp_block_1(var_to)
        return (expr)
    else:
        return (expr)
    end
end

func __warp_block_3{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = is_lt(_2, var_value)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    require_helper_stringliteral_dc58(__warp_subexpr_0)
    let (__warp_subexpr_5 : Uint256) = caller()
    let (__warp_subexpr_4 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2934(
        var_from)
    let (__warp_subexpr_3 : Uint256) = checked_sub_uint256(_2, var_value)
    let (__warp_subexpr_2 : Uint256) = mapping_index_access_mapping_address_uint256_of_address(
        __warp_subexpr_4, __warp_subexpr_5)
    sstore(key=__warp_subexpr_2, value=__warp_subexpr_3)
    return ()
end

func __warp_if_2{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, __warp_subexpr_3 : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_3.low + __warp_subexpr_3.high != 0:
        __warp_block_3(_2, var_from, var_value)
        return ()
    else:
        return ()
    end
end

func __warp_block_2{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = caller()
    let (__warp_subexpr_1 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2934(
        var_from)
    let (__warp_subexpr_0 : Uint256) = mapping_index_access_mapping_address_uint256_of_address(
        __warp_subexpr_1, __warp_subexpr_2)
    let (_2 : Uint256) = sload(__warp_subexpr_0)
    let (__warp_subexpr_4 : Uint256) = is_eq(
        _2,
        Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_3 : Uint256) = is_zero(__warp_subexpr_4)
    __warp_if_2(_2, __warp_subexpr_3, var_from, var_value)
    return ()
end

func __warp_if_3{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        __warp_subexpr_4 : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_4.low + __warp_subexpr_4.high != 0:
        __warp_block_2(var_from, var_value)
        return ()
    else:
        return ()
    end
end

func fun_transferFrom{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_from : Uint256, var_to : Uint256, var_value : Uint256) -> (var : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(var_to)
    let (expr : Uint256) = is_zero(__warp_subexpr_0)
    let (expr : Uint256) = __warp_if_1(expr, var_to)
    require_helper_stringliteral_d9f1(expr)
    let (__warp_subexpr_1 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(
        var_from)
    let (_1 : Uint256) = sload(__warp_subexpr_1)
    let (__warp_subexpr_3 : Uint256) = is_lt(_1, var_value)
    let (__warp_subexpr_2 : Uint256) = is_zero(__warp_subexpr_3)
    require_helper_stringliteral_81d4(__warp_subexpr_2)
    let (__warp_subexpr_6 : Uint256) = caller()
    let (__warp_subexpr_5 : Uint256) = is_eq(var_from, __warp_subexpr_6)
    let (__warp_subexpr_4 : Uint256) = is_zero(__warp_subexpr_5)
    __warp_if_3(__warp_subexpr_4, var_from, var_value)
    let (__warp_subexpr_8 : Uint256) = checked_sub_uint256(_1, var_value)
    let (__warp_subexpr_7 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(
        var_from)
    sstore(key=__warp_subexpr_7, value=__warp_subexpr_8)
    let (_3 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(var_to)
    let (__warp_subexpr_10 : Uint256) = sload(_3)
    let (__warp_subexpr_9 : Uint256) = checked_add_uint256(__warp_subexpr_10, var_value)
    sstore(key=_3, value=__warp_subexpr_9)
    let (_4 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_12 : Uint256) = abi_encode_uint256(_4, var_value)
    let (__warp_subexpr_11 : Uint256) = uint256_sub(__warp_subexpr_12, _4)
    log3(
        _4,
        __warp_subexpr_11,
        Uint256(low=198281646424137164560101327737152844783, high=295017599780921710443122883678831087018),
        var_from,
        var_to)
    let var : Uint256 = Uint256(low=1, high=0)
    return (var)
end

func abi_encode_uint8{memory_dict : DictAccess*, msize, range_check_ptr}(headStart : Uint256) -> (
        tail : Uint256):
    alloc_locals
    let (tail : Uint256) = u256_add(headStart, Uint256(low=32, high=0))
    uint256_mstore(offset=headStart, value=Uint256(low=18, high=0))
    return (tail)
end

func fun_increaseAllowance{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_spender : Uint256, var_addedValue : Uint256) -> (var_ : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_spender)
    uint256_mstore(offset=Uint256(low=32, high=0), value=dataSlot)
    let (__warp_subexpr_1 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (_2 : Uint256) = sload(__warp_subexpr_1)
    let (var_z : Uint256) = checked_add_uint256(_2, var_addedValue)
    let (__warp_subexpr_2 : Uint256) = is_lt(var_z, _2)
    if __warp_subexpr_2.low + __warp_subexpr_2.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (__warp_subexpr_3 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_3)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot_1 : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_spender)
    uint256_mstore(offset=Uint256(low=32, high=0), value=dataSlot_1)
    let (__warp_subexpr_4 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_4, value=var_z)
    let (_3 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    uint256_mstore(offset=_3, value=var_z)
    let (__warp_subexpr_5 : Uint256) = caller()
    log3(
        _3,
        Uint256(low=32, high=0),
        Uint256(low=293775384895699468565546264665434339621, high=186569000182439804704099571914554377459),
        __warp_subexpr_5,
        var_spender)
    let var_ : Uint256 = Uint256(low=1, high=0)
    return (var_)
end

func require_helper_stringliteral_3be4{range_check_ptr}(condition : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(condition)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func __warp_block_4{range_check_ptr, syscall_ptr : felt*}(var_to : Uint256) -> (expr : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = address()
    let (__warp_subexpr_0 : Uint256) = is_eq(var_to, __warp_subexpr_1)
    let (expr : Uint256) = is_zero(__warp_subexpr_0)
    return (expr)
end

func __warp_if_4{range_check_ptr, syscall_ptr : felt*}(expr : Uint256, var_to : Uint256) -> (
        expr : Uint256):
    alloc_locals
    if expr.low + expr.high != 0:
        let (expr : Uint256) = __warp_block_4(var_to)
        return (expr)
    else:
        return (expr)
    end
end

func modifier_auth{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_to : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_3 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = sload(__warp_subexpr_3)
    let (__warp_subexpr_1 : Uint256) = is_eq(__warp_subexpr_2, Uint256(low=1, high=0))
    require_helper_stringliteral_3be4(__warp_subexpr_1)
    let (__warp_subexpr_4 : Uint256) = is_zero(var_to)
    let (expr : Uint256) = is_zero(__warp_subexpr_4)
    let (expr : Uint256) = __warp_if_4(expr, var_to)
    require_helper_stringliteral_d9f1(expr)
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_to)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (__warp_subexpr_6 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (__warp_subexpr_5 : Uint256) = sload(__warp_subexpr_6)
    let (_2 : Uint256) = checked_add_uint256(__warp_subexpr_5, var_value)
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_to)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (__warp_subexpr_7 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_7, value=_2)
    let (_3 : Uint256) = sload(Uint256(low=1, high=0))
    let (var_z : Uint256) = checked_add_uint256(_3, var_value)
    let (__warp_subexpr_8 : Uint256) = is_lt(var_z, _3)
    if __warp_subexpr_8.low + __warp_subexpr_8.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    sstore(key=Uint256(low=1, high=0), value=var_z)
    let (_4 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    uint256_mstore(offset=_4, value=var_value)
    log3(
        _4,
        Uint256(low=32, high=0),
        Uint256(low=198281646424137164560101327737152844783, high=295017599780921710443122883678831087018),
        Uint256(low=0, high=0),
        var_to)
    return ()
end

func copy_literal_to_memory_ad7c5bef027816a800da1736444fb58a807ef4c9603b7848673f7e3a68eb14a5{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}() -> (
        memPtr : Uint256):
    alloc_locals
    let (memPtr_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (newFreePtr : Uint256) = u256_add(memPtr_1, Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = is_lt(newFreePtr, memPtr_1)
    let (__warp_subexpr_1 : Uint256) = is_gt(newFreePtr, Uint256(low=18446744073709551615, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_or(__warp_subexpr_1, __warp_subexpr_2)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    uint256_mstore(offset=Uint256(low=64, high=0), value=newFreePtr)
    uint256_mstore(offset=memPtr_1, value=Uint256(low=1, high=0))
    let memPtr : Uint256 = memPtr_1
    let (__warp_subexpr_3 : Uint256) = u256_add(memPtr_1, Uint256(low=32, high=0))
    uint256_mstore(
        offset=__warp_subexpr_3, value=Uint256(low=0, high=66461399789245793645190353014017228800))
    return (memPtr)
end

func abi_decode_address{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, range_check_ptr}(
        dataEnd : Uint256) -> (value0 : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = u256_add(
        dataEnd,
        Uint256(low=340282366920938463463374607431768211452, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_0 : Uint256) = slt(__warp_subexpr_1, Uint256(low=32, high=0))
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (value0 : Uint256) = calldataload(Uint256(low=4, high=0))
    return (value0)
end

func modifier_auth_10{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(var_usr : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_3 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = sload(__warp_subexpr_3)
    let (__warp_subexpr_1 : Uint256) = is_eq(__warp_subexpr_2, Uint256(low=1, high=0))
    require_helper_stringliteral_3be4(__warp_subexpr_1)
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_usr)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_4 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_4, value=Uint256(low=1, high=0))
    let (__warp_subexpr_5 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    log2(
        __warp_subexpr_5,
        Uint256(low=0, high=0),
        Uint256(low=223900192535450488218712201491897670240, high=293833134190415102004153989462159305800),
        var_usr)
    return ()
end

func getter_fun_balanceOf{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(key : Uint256) -> (
        ret__warp_mangled : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (ret__warp_mangled : Uint256) = sload(__warp_subexpr_0)
    return (ret__warp_mangled)
end

func getter_fun_nonces{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(key : Uint256) -> (
        ret__warp_mangled : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=4, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (ret__warp_mangled : Uint256) = sload(__warp_subexpr_0)
    return (ret__warp_mangled)
end

func copy_literal_to_memory_a5e92f3efb6826155f1f728e162af9d7cda33a574a1153b58f03ea01cc37e568{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize, range_check_ptr}() -> (
        memPtr : Uint256):
    alloc_locals
    let (memPtr_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (newFreePtr : Uint256) = u256_add(memPtr_1, Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = is_lt(newFreePtr, memPtr_1)
    let (__warp_subexpr_1 : Uint256) = is_gt(newFreePtr, Uint256(low=18446744073709551615, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_or(__warp_subexpr_1, __warp_subexpr_2)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    uint256_mstore(offset=Uint256(low=64, high=0), value=newFreePtr)
    uint256_mstore(offset=memPtr_1, value=Uint256(low=3, high=0))
    let memPtr : Uint256 = memPtr_1
    let (__warp_subexpr_3 : Uint256) = u256_add(memPtr_1, Uint256(low=32, high=0))
    uint256_mstore(
        offset=__warp_subexpr_3, value=Uint256(low=0, high=90726483625080109725254310509806616576))
    return (memPtr)
end

func modifier_auth_28{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(var_usr : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_3 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = sload(__warp_subexpr_3)
    let (__warp_subexpr_1 : Uint256) = is_eq(__warp_subexpr_2, Uint256(low=1, high=0))
    require_helper_stringliteral_3be4(__warp_subexpr_1)
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_usr)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_4 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_4, value=Uint256(low=0, high=0))
    let (__warp_subexpr_5 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    log2(
        __warp_subexpr_5,
        Uint256(low=0, high=0),
        Uint256(low=206429476217168368767601451326892221723, high=32256188360163916496962365474236119071),
        var_usr)
    return ()
end

func update_storage_value_offsett_uint256_to_uint256{
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(value : Uint256) -> ():
    alloc_locals
    sstore(key=Uint256(low=1, high=0), value=value)
    return ()
end

func __warp_block_5{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}() -> (expr : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_3 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = sload(__warp_subexpr_3)
    let (__warp_subexpr_1 : Uint256) = is_eq(__warp_subexpr_2, Uint256(low=1, high=0))
    let (expr : Uint256) = is_zero(__warp_subexpr_1)
    return (expr)
end

func __warp_if_5{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(expr : Uint256) -> (
        expr : Uint256):
    alloc_locals
    if expr.low + expr.high != 0:
        let (expr : Uint256) = __warp_block_5()
        return (expr)
    else:
        return (expr)
    end
end

func __warp_block_7{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = is_lt(_2, var_value)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    require_helper_stringliteral_dc58(__warp_subexpr_0)
    let (__warp_subexpr_5 : Uint256) = caller()
    let (__warp_subexpr_4 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2934(
        var_from)
    let (__warp_subexpr_3 : Uint256) = checked_sub_uint256(_2, var_value)
    let (__warp_subexpr_2 : Uint256) = mapping_index_access_mapping_address_uint256_of_address(
        __warp_subexpr_4, __warp_subexpr_5)
    sstore(key=__warp_subexpr_2, value=__warp_subexpr_3)
    return ()
end

func __warp_if_6{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, __warp_subexpr_3 : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_3.low + __warp_subexpr_3.high != 0:
        __warp_block_7(_2, var_from, var_value)
        return ()
    else:
        return ()
    end
end

func __warp_block_6{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = caller()
    let (__warp_subexpr_1 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2934(
        var_from)
    let (__warp_subexpr_0 : Uint256) = mapping_index_access_mapping_address_uint256_of_address(
        __warp_subexpr_1, __warp_subexpr_2)
    let (_2 : Uint256) = sload(__warp_subexpr_0)
    let (__warp_subexpr_4 : Uint256) = is_eq(
        _2,
        Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_3 : Uint256) = is_zero(__warp_subexpr_4)
    __warp_if_6(_2, __warp_subexpr_3, var_from, var_value)
    return ()
end

func __warp_if_7{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        expr : Uint256, var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    if expr.low + expr.high != 0:
        __warp_block_6(var_from, var_value)
        return ()
    else:
        return ()
    end
end

func fun_burn{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_from : Uint256, var_value : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(
        var_from)
    let (_1 : Uint256) = sload(__warp_subexpr_0)
    let (__warp_subexpr_2 : Uint256) = is_lt(_1, var_value)
    let (__warp_subexpr_1 : Uint256) = is_zero(__warp_subexpr_2)
    require_helper_stringliteral_81d4(__warp_subexpr_1)
    let (__warp_subexpr_4 : Uint256) = caller()
    let (__warp_subexpr_3 : Uint256) = is_eq(var_from, __warp_subexpr_4)
    let (expr : Uint256) = is_zero(__warp_subexpr_3)
    let (expr : Uint256) = __warp_if_5(expr)
    __warp_if_7(expr, var_from, var_value)
    let (__warp_subexpr_6 : Uint256) = checked_sub_uint256(_1, var_value)
    let (__warp_subexpr_5 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(
        var_from)
    sstore(key=__warp_subexpr_5, value=__warp_subexpr_6)
    let (__warp_subexpr_8 : Uint256) = sload(Uint256(low=1, high=0))
    let (__warp_subexpr_7 : Uint256) = checked_sub_uint256(__warp_subexpr_8, var_value)
    update_storage_value_offsett_uint256_to_uint256(__warp_subexpr_7)
    let (_3 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_10 : Uint256) = abi_encode_uint256(_3, var_value)
    let (__warp_subexpr_9 : Uint256) = uint256_sub(__warp_subexpr_10, _3)
    log3(
        _3,
        __warp_subexpr_9,
        Uint256(low=198281646424137164560101327737152844783, high=295017599780921710443122883678831087018),
        var_from,
        Uint256(low=0, high=0))
    return ()
end

func fun_decreaseAllowance{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_spender : Uint256, var_subtractedValue : Uint256) -> (var : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_0)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_spender)
    uint256_mstore(offset=Uint256(low=32, high=0), value=dataSlot)
    let (__warp_subexpr_1 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (_2 : Uint256) = sload(__warp_subexpr_1)
    let (_3 : Uint256) = is_lt(_2, var_subtractedValue)
    let (__warp_subexpr_2 : Uint256) = is_zero(_3)
    require_helper_stringliteral_dc58(__warp_subexpr_2)
    if _3.low + _3.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (diff : Uint256) = uint256_sub(_2, var_subtractedValue)
    let (__warp_subexpr_3 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_3)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot_1 : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    uint256_mstore(offset=Uint256(low=0, high=0), value=var_spender)
    uint256_mstore(offset=Uint256(low=32, high=0), value=dataSlot_1)
    let (__warp_subexpr_4 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_4, value=diff)
    let (_4 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    uint256_mstore(offset=_4, value=diff)
    let (__warp_subexpr_5 : Uint256) = caller()
    log3(
        _4,
        Uint256(low=32, high=0),
        Uint256(low=293775384895699468565546264665434339621, high=186569000182439804704099571914554377459),
        __warp_subexpr_5,
        var_spender)
    let var : Uint256 = Uint256(low=1, high=0)
    return (var)
end

func __warp_block_8{range_check_ptr, syscall_ptr : felt*}(var_to : Uint256) -> (expr : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = address()
    let (__warp_subexpr_0 : Uint256) = is_eq(var_to, __warp_subexpr_1)
    let (expr : Uint256) = is_zero(__warp_subexpr_0)
    return (expr)
end

func __warp_if_8{range_check_ptr, syscall_ptr : felt*}(expr : Uint256, var_to : Uint256) -> (
        expr : Uint256):
    alloc_locals
    if expr.low + expr.high != 0:
        let (expr : Uint256) = __warp_block_8(var_to)
        return (expr)
    else:
        return (expr)
    end
end

func fun_transfer{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        var_to : Uint256, var_value : Uint256) -> (var : Uint256):
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_zero(var_to)
    let (expr : Uint256) = is_zero(__warp_subexpr_0)
    let (expr : Uint256) = __warp_if_8(expr, var_to)
    require_helper_stringliteral_d9f1(expr)
    let (__warp_subexpr_1 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_1)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (__warp_subexpr_2 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (_1 : Uint256) = sload(__warp_subexpr_2)
    let (_2 : Uint256) = is_lt(_1, var_value)
    let (__warp_subexpr_3 : Uint256) = is_zero(_2)
    require_helper_stringliteral_81d4(__warp_subexpr_3)
    if _2.low + _2.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (__warp_subexpr_4 : Uint256) = caller()
    uint256_mstore(offset=Uint256(low=0, high=0), value=__warp_subexpr_4)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=2, high=0))
    let (__warp_subexpr_6 : Uint256) = uint256_sub(_1, var_value)
    let (__warp_subexpr_5 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    sstore(key=__warp_subexpr_5, value=__warp_subexpr_6)
    let (_3 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2932(var_to)
    let (__warp_subexpr_8 : Uint256) = sload(_3)
    let (__warp_subexpr_7 : Uint256) = checked_add_uint256(__warp_subexpr_8, var_value)
    sstore(key=_3, value=__warp_subexpr_7)
    let (_4 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    uint256_mstore(offset=_4, value=var_value)
    let (__warp_subexpr_9 : Uint256) = caller()
    log3(
        _4,
        Uint256(low=32, high=0),
        Uint256(low=198281646424137164560101327737152844783, high=295017599780921710443122883678831087018),
        __warp_subexpr_9,
        var_to)
    let var : Uint256 = Uint256(low=1, high=0)
    return (var)
end

func getter_fun_wards{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(key : Uint256) -> (
        ret__warp_mangled : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_0 : Uint256) = uint256_pedersen(
        Uint256(low=0, high=0), Uint256(low=64, high=0))
    let (ret__warp_mangled : Uint256) = sload(__warp_subexpr_0)
    return (ret__warp_mangled)
end

func mapping_index_access_mapping_address_uint256_of_address_2924{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr}(key : Uint256) -> (dataSlot : Uint256):
    alloc_locals
    uint256_mstore(offset=Uint256(low=0, high=0), value=key)
    uint256_mstore(offset=Uint256(low=32, high=0), value=Uint256(low=3, high=0))
    let (dataSlot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=64, high=0))
    return (dataSlot)
end

func __warp_block_11{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    abi_decode(__warp_subexpr_0)
    let (
        ret_mpos : Uint256) = copy_literal_to_memory_0b1461ddc0c1d5ded79a1db0f74dae949050a7c0b28728c724b24958c27a328b(
        )
    let (memPos : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_string(memPos, ret_mpos)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos)
    warp_return(memPos, __warp_subexpr_1)
    return ()
end

func __warp_block_13{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param : Uint256, param_1 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    let (ret__warp_mangled : Uint256) = fun_approve(param, param_1)
    let (memPos_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_bool(memPos_1, ret__warp_mangled)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_1)
    warp_return(memPos_1, __warp_subexpr_1)
    return ()
end

func __warp_block_15{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    abi_decode(__warp_subexpr_0)
    let (ret_1 : Uint256) = sload(Uint256(low=1, high=0))
    let (memPos_2 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_uint256(memPos_2, ret_1)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_2)
    warp_return(memPos_2, __warp_subexpr_1)
    return ()
end

func __warp_block_17{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_2 : Uint256, param_3 : Uint256,
        param_4 : Uint256) = abi_decode_addresst_addresst_uint256(__warp_subexpr_0)
    let (ret_2 : Uint256) = fun_transferFrom(param_2, param_3, param_4)
    let (memPos_3 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_bool(memPos_3, ret_2)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_3)
    warp_return(memPos_3, __warp_subexpr_1)
    return ()
end

func __warp_block_19{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    abi_decode(__warp_subexpr_0)
    let (memPos_4 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_uint8(memPos_4)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_4)
    warp_return(memPos_4, __warp_subexpr_1)
    return ()
end

func __warp_block_21{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_5 : Uint256, param_6 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    let (ret_3 : Uint256) = fun_increaseAllowance(param_5, param_6)
    let (memPos_5 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_bool(memPos_5, ret_3)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_5)
    warp_return(memPos_5, __warp_subexpr_1)
    return ()
end

func __warp_block_23{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_7 : Uint256, param_8 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    modifier_auth(param_7, param_8)
    let (__warp_subexpr_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    warp_return(__warp_subexpr_1, Uint256(low=0, high=0))
    return ()
end

func __warp_block_25{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    abi_decode(__warp_subexpr_0)
    let (
        ret_mpos_1 : Uint256) = copy_literal_to_memory_ad7c5bef027816a800da1736444fb58a807ef4c9603b7848673f7e3a68eb14a5(
        )
    let (memPos_6 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_string(memPos_6, ret_mpos_1)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_6)
    warp_return(memPos_6, __warp_subexpr_1)
    return ()
end

func __warp_block_27{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = calldatasize()
    let (__warp_subexpr_0 : Uint256) = abi_decode_address(__warp_subexpr_1)
    modifier_auth_10(__warp_subexpr_0)
    let (__warp_subexpr_2 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    warp_return(__warp_subexpr_2, Uint256(low=0, high=0))
    return ()
end

func __warp_block_29{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = calldatasize()
    let (__warp_subexpr_0 : Uint256) = abi_decode_address(__warp_subexpr_1)
    let (ret_4 : Uint256) = getter_fun_balanceOf(__warp_subexpr_0)
    let (memPos_7 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_3 : Uint256) = abi_encode_uint256(memPos_7, ret_4)
    let (__warp_subexpr_2 : Uint256) = uint256_sub(__warp_subexpr_3, memPos_7)
    warp_return(memPos_7, __warp_subexpr_2)
    return ()
end

func __warp_block_31{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = calldatasize()
    let (__warp_subexpr_0 : Uint256) = abi_decode_address(__warp_subexpr_1)
    let (ret_5 : Uint256) = getter_fun_nonces(__warp_subexpr_0)
    let (memPos_8 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_3 : Uint256) = abi_encode_uint256(memPos_8, ret_5)
    let (__warp_subexpr_2 : Uint256) = uint256_sub(__warp_subexpr_3, memPos_8)
    warp_return(memPos_8, __warp_subexpr_2)
    return ()
end

func __warp_block_33{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    abi_decode(__warp_subexpr_0)
    let (
        ret_mpos_2 : Uint256) = copy_literal_to_memory_a5e92f3efb6826155f1f728e162af9d7cda33a574a1153b58f03ea01cc37e568(
        )
    let (memPos_9 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_string(memPos_9, ret_mpos_2)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_9)
    warp_return(memPos_9, __warp_subexpr_1)
    return ()
end

func __warp_block_35{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = calldatasize()
    let (__warp_subexpr_0 : Uint256) = abi_decode_address(__warp_subexpr_1)
    modifier_auth_28(__warp_subexpr_0)
    let (__warp_subexpr_2 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    warp_return(__warp_subexpr_2, Uint256(low=0, high=0))
    return ()
end

func __warp_block_37{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_9 : Uint256, param_10 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    fun_burn(param_9, param_10)
    let (__warp_subexpr_1 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    warp_return(__warp_subexpr_1, Uint256(low=0, high=0))
    return ()
end

func __warp_block_39{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_11 : Uint256, param_12 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    let (ret_6 : Uint256) = fun_decreaseAllowance(param_11, param_12)
    let (memPos_10 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_bool(memPos_10, ret_6)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_10)
    warp_return(memPos_10, __warp_subexpr_1)
    return ()
end

func __warp_block_41{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_13 : Uint256, param_14 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    let (ret_7 : Uint256) = fun_transfer(param_13, param_14)
    let (memPos_11 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_2 : Uint256) = abi_encode_bool(memPos_11, ret_7)
    let (__warp_subexpr_1 : Uint256) = uint256_sub(__warp_subexpr_2, memPos_11)
    warp_return(memPos_11, __warp_subexpr_1)
    return ()
end

func __warp_block_43{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = calldatasize()
    let (__warp_subexpr_0 : Uint256) = abi_decode_address(__warp_subexpr_1)
    let (ret_8 : Uint256) = getter_fun_wards(__warp_subexpr_0)
    let (memPos_12 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_3 : Uint256) = abi_encode_uint256(memPos_12, ret_8)
    let (__warp_subexpr_2 : Uint256) = uint256_sub(__warp_subexpr_3, memPos_12)
    warp_return(memPos_12, __warp_subexpr_2)
    return ()
end

func __warp_block_45{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldatasize()
    let (param_15 : Uint256, param_16 : Uint256) = abi_decode_addresst_uint256(__warp_subexpr_0)
    let (__warp_subexpr_2 : Uint256) = mapping_index_access_mapping_address_uint256_of_address_2924(
        param_15)
    let (__warp_subexpr_1 : Uint256) = mapping_index_access_mapping_address_uint256_of_address(
        __warp_subexpr_2, param_16)
    let (value : Uint256) = sload(__warp_subexpr_1)
    let (memPos_13 : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_4 : Uint256) = abi_encode_uint256(memPos_13, value)
    let (__warp_subexpr_3 : Uint256) = uint256_sub(__warp_subexpr_4, memPos_13)
    warp_return(memPos_13, __warp_subexpr_3)
    return ()
end

func __warp_if_9{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_45()
        return ()
    else:
        return ()
    end
end

func __warp_block_44{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=3714247998, high=0))
    __warp_if_9(__warp_subexpr_0)
    return ()
end

func __warp_if_10{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_43()
        return ()
    else:
        __warp_block_44(match_var)
        return ()
    end
end

func __warp_block_42{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=3207937467, high=0))
    __warp_if_10(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_11{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_41()
        return ()
    else:
        __warp_block_42(match_var)
        return ()
    end
end

func __warp_block_40{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2835717307, high=0))
    __warp_if_11(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_12{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_39()
        return ()
    else:
        __warp_block_40(match_var)
        return ()
    end
end

func __warp_block_38{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2757214935, high=0))
    __warp_if_12(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_13{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_37()
        return ()
    else:
        __warp_block_38(match_var)
        return ()
    end
end

func __warp_block_36{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2646777772, high=0))
    __warp_if_13(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_14{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_35()
        return ()
    else:
        __warp_block_36(match_var)
        return ()
    end
end

func __warp_block_34{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2622662641, high=0))
    __warp_if_14(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_15{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_33()
        return ()
    else:
        __warp_block_34(match_var)
        return ()
    end
end

func __warp_block_32{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2514000705, high=0))
    __warp_if_15(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_16{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_31()
        return ()
    else:
        __warp_block_32(match_var)
        return ()
    end
end

func __warp_block_30{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=2127478272, high=0))
    __warp_if_16(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_17{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_29()
        return ()
    else:
        __warp_block_30(match_var)
        return ()
    end
end

func __warp_block_28{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=1889567281, high=0))
    __warp_if_17(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_18{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_27()
        return ()
    else:
        __warp_block_28(match_var)
        return ()
    end
end

func __warp_block_26{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=1710941022, high=0))
    __warp_if_18(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_19{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_25()
        return ()
    else:
        __warp_block_26(match_var)
        return ()
    end
end

func __warp_block_24{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=1425886544, high=0))
    __warp_if_19(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_20{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_23()
        return ()
    else:
        __warp_block_24(match_var)
        return ()
    end
end

func __warp_block_22{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=1086394137, high=0))
    __warp_if_20(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_21{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_21()
        return ()
    else:
        __warp_block_22(match_var)
        return ()
    end
end

func __warp_block_20{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=961581905, high=0))
    __warp_if_21(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_22{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_19()
        return ()
    else:
        __warp_block_20(match_var)
        return ()
    end
end

func __warp_block_18{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=826074471, high=0))
    __warp_if_22(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_23{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_17()
        return ()
    else:
        __warp_block_18(match_var)
        return ()
    end
end

func __warp_block_16{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=599290589, high=0))
    __warp_if_23(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_24{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_15()
        return ()
    else:
        __warp_block_16(match_var)
        return ()
    end
end

func __warp_block_14{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=404098525, high=0))
    __warp_if_24(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_25{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_13()
        return ()
    else:
        __warp_block_14(match_var)
        return ()
    end
end

func __warp_block_12{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=157198259, high=0))
    __warp_if_25(__warp_subexpr_0, match_var)
    return ()
end

func __warp_if_26{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256, match_var : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_11()
        return ()
    else:
        __warp_block_12(match_var)
        return ()
    end
end

func __warp_block_10{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(match_var : Uint256) -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = is_eq(match_var, Uint256(low=117300739, high=0))
    __warp_if_26(__warp_subexpr_0, match_var)
    return ()
end

func __warp_block_9{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = calldataload(Uint256(low=0, high=0))
    let (match_var : Uint256) = u256_shr(Uint256(low=224, high=0), __warp_subexpr_0)
    __warp_block_10(match_var)
    return ()
end

func __warp_if_27{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_1 : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_1.low + __warp_subexpr_1.high != 0:
        __warp_block_9()
        return ()
    else:
        return ()
    end
end

func __main_meat{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_0 : Uint256) = __warp_identity_Uint256(Uint256(low=128, high=0))
    uint256_mstore(offset=Uint256(low=64, high=0), value=__warp_subexpr_0)
    let (__warp_subexpr_3 : Uint256) = calldatasize()
    let (__warp_subexpr_2 : Uint256) = is_lt(__warp_subexpr_3, Uint256(low=4, high=0))
    let (__warp_subexpr_1 : Uint256) = is_zero(__warp_subexpr_2)
    __warp_if_27(__warp_subexpr_1)
    if termination_token == 1:
        return ()
    end
    assert 0 = 1
    jmp rel 0
end