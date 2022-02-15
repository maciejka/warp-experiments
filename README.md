# Warp evaluation
* solidity: [dai.sol](contracts/dai.sol)
* transpiled cairo: [dai.cairo](contracts/dai.cairo)
* native cairo: [dai.cairo](https://github.com/makerdao/starknet-dai-bridge/blob/main/contracts/l2/dai.cairo)

loc: 1768 vs 430

## Constructor
* transpiled
    * `n_steps`: 1392
    * `pedersen_builtin`: 6,
    * `range_check_builtin`: 67
* native
    * `n_steps`: 111
    * `pedersen_builtin`: 1,
    * `range_check_builtin`: 3

### transpiled
```
(cairo_venv) maciejka@X1:~/projects/maker/starknet-dai-bridge$ starknet get_transaction_receipt --hash  0x775644ea5ae7c753fcd50e97b081348f96db373f9bac4b90f3348ae04f1e66
{
    "block_hash": "0x2cf9b5ff2900f0d10e8a0730e897e0d2cd249c78f9e0376e0da732a4618288d",
    "block_number": 68859,
    "events": [
        {
            "data": [],
            "from_address": "0x6442e8441f7b73cfab3d3563cac9830dd6ebf322ce0578ff0f9b33564903804",
            "keys": [
                "223900192535450488218712201491897670240",
                "293833134190415102004153989462159305800",
                "0",
                "0"
            ]
        }
    ],
    "execution_resources": {
        "builtin_instance_counter": {
            "bitwise_builtin": 0,
            "ec_op_builtin": 0,
            "ecdsa_builtin": 0,
            "output_builtin": 0,
            "pedersen_builtin": 6,
            "range_check_builtin": 67
        },
        "n_memory_holes": 21,
        "n_steps": 1392
    },
    "l2_to_l1_messages": [],
    "status": "ACCEPTED_ON_L2",
    "transaction_hash": "0x775644ea5ae7c753fcd50e97b081348f96db373f9bac4b90f3348ae04f1e66",
    "transaction_index": 6
}
```

### native
```
(cairo_venv) maciejka@X1:~/projects/maker/starknet-dai-bridge$ starknet get_transaction_receipt --hash  0x44aa605e1ab75c2f2f5b49385f8fe612503ff58cf4fa564ac17516e7a51e834
{
    "block_hash": "0x7c952f3920e01a305ca33ee9379bc578238671fc985e4058f241d1d5491e9ea",
    "block_number": 51989,
    "events": [
        {
            "data": [
                "503938113938745590997298417517866288163662259785383367920265528095888038169"
            ],
            "from_address": "0xda19dab05e9f3cd09c3aa0d8046415b3d7f7dbbd83e1c2e4946792298fbe28",
            "keys": [
                "1721755586656337256828716504348548063126269799266918699117823686106611979840"
            ]
        }
    ],
    "execution_resources": {
        "builtin_instance_counter": {
            "bitwise_builtin": 0,
            "ec_op_builtin": 0,
            "ecdsa_builtin": 0,
            "output_builtin": 0,
            "pedersen_builtin": 1,
            "range_check_builtin": 3
        },
        "n_memory_holes": 11,
        "n_steps": 111
    },
    "l2_to_l1_messages": [],
    "status": "ACCEPTED_ON_L1",
    "transaction_hash": "0x44aa605e1ab75c2f2f5b49385f8fe612503ff58cf4fa564ac17516e7a51e834",
    "transaction_index": 18
}
```