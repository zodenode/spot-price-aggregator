// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
 * @title GasEstimator
 * @notice The GasEstimator contract provides functions to estimate the gas limit and gas cost of a contract call.
 */
contract GasEstimator {
    /**
     * @dev Returns the remaining gas limit for the current transaction.
     * @return gasLimit The remaining gas limit.
     */
    function gasLimit() external view returns (uint256) {
        return gasleft();
    }

    /**
     * @dev Estimates the gas cost and success status of a contract call.
     * @notice This function executes a staticcall to estimate the gas cost of the contract call.
     * It returns the difference in gas before and after the call as the gas used and the success status of the call.
     */
    function gasCost(address target, bytes calldata data) external view returns (uint256 gasUsed, bool success) {
        uint256 gas = gasleft();
        (bool s, ) = target.staticcall(data);
        return (gas - gasleft(), s);
    }
}
