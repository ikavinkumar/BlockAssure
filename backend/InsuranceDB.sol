// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;
contract InsuranceDB {
    struct InsurancePolicy {
        string policyNumber;
        string insurerName;
        uint256 coverageAmount;
        uint256 premiumAmount;
        uint256 startDate;
        uint256 endDate;
    }

    mapping (address => InsurancePolicy[]) private policies;

    function addPolicy(
        string memory policyNumber,
        string memory insurerName,
        uint256 coverageAmount,
        uint256 premiumAmount,
        uint256 startDate,
        uint256 endDate
    ) public {
        InsurancePolicy memory policy = InsurancePolicy(
            policyNumber,
            insurerName,
            coverageAmount,
            premiumAmount,
            startDate,
            endDate
        );

        policies[msg.sender].push(policy);
    }

    function getPolicies(address policyHolder) public view returns (InsurancePolicy[] memory) {
        return policies[policyHolder];
    }

    function getPolicy(address policyHolder, uint256 policyIndex) public view returns (InsurancePolicy memory) {
        return policies[policyHolder][policyIndex];
    }
}
