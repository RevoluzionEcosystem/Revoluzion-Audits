// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }
    
    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the Exponentiation of two unsigned integers, with an overflow flag.
     *
     * _Custom function for this project usage_
     */
    function tryPow(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (true, 1);
            if (a == 0) return (true, 0);
            uint256 c = a ** b;
            return (true, c);
        }
    }

}

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }
}

/**
 * @title Counters
 * @author Matt Condon (@shrugs)
 * @dev Provides counters that can only be incremented, decremented or reset. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 *
 * Include with `using Counters for Counters.Counter;`
 */
library Counters {
    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        unchecked {
            counter._value += 1;
        }
    }

    function decrement(Counter storage counter) internal {
        unchecked {
            counter._value -= 1;
        }
    }
}

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgValue() internal view virtual returns (uint256) {
        return msg.value;
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Auth is Context {
    

    /** DATA **/
    address private _owner;
    
    mapping(address => bool) internal authorizations;

    
    /** CONSTRUCTOR **/

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _owner = _msgSender();
        authorizations[_msgSender()] = true;
    }

    /** FUNCTION **/

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Throws if called by any account other authorized accounts.
     */
    modifier authorized() {
        require(isAuthorized(_msgSender()), "Ownable: caller is not an authorized account");
        _;
    }

    /**
     * @dev Authorize address. Owner only
     */
    function authorize(address adr) public onlyOwner {
        authorizations[adr] = true;
    }

    /**
     * @dev Remove address' authorization. Owner only
     */
    function unauthorize(address adr) public onlyOwner {
        authorizations[adr] = false;
    }

    /**
     * @dev Check if address is owner
     */
    function isOwner(address adr) public view returns (bool) {
        return adr == owner();
    }

    /**
     * @dev Return address' authorization status
     */
    function isAuthorized(address adr) public view returns (bool) {
        return authorizations[adr];
    }
}

/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
abstract contract Pausable is Context {
    /**
     * @dev Emitted when the pause is triggered by `account`.
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    constructor() {
        _paused = false;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        _requireNotPaused();
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        _requirePaused();
        _;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Throws if the contract is paused.
     */
    function _requireNotPaused() internal view virtual {
        require(!paused(), "Pausable: paused");
    }

    /**
     * @dev Throws if the contract is not paused.
     */
    function _requirePaused() internal view virtual {
        require(paused(), "Pausable: not paused");
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

interface IFactory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
        
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface IRouter {
    function WETH() external pure returns (address);

    function factory() external pure returns (address);

    function addLiquidityETH(address token, uint256 amountTokenDesired, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external payable returns (uint256 amountToken, uint256 amountETH, uint256 liquidity);

    function swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external payable;
    
    function swapExactTokensForETHSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external;
    
    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);
}

interface IStaking {
    function deposit() external payable;
    
    function updateRewards() external;
}

contract Staking is Auth, IStaking, Pausable {

    // LIBRARY

    using SafeMath for uint256;

    // DATA

    IERC20 public token;
    IERC20 public rewardToken;
    IRouter public router;
    
    address private constant DEAD = address(0xdead);
    address private constant ZERO = address(0);
    address private constant USDT = 0x55d398326f99059fF775485246999027B3197955;

    struct Stake {
        uint256 amount;
        uint256 totalExcluded;
        uint256 totalRealised;
    }

    struct UserStake {
        uint256 stakeAmount;
        uint256 stakePrice;
        uint256 stakeTime;
    }
        
    address public penaltyReceiver;
    address[] public stakers;

    bool public initialized = false;
    bool public emergencyWithdraw = false;
    
    uint256 public balanceSwapped = 0;
    uint256 public penaltyNumerator = 10;
    uint256 public penaltyDenominator = 100;
    uint256 public totalStaked = 0;
    uint256 public totalRewards = 0;
    uint256 public totalDistributed = 0;
    uint256 public rewardsPerStake = 0;
    uint256 public rewardsPerStakeAccuracyFactor = 0;
    
    mapping(address => Stake) public stakes;
    mapping(address => uint256) public stakerIndexes;
    mapping(address => uint256) public stakerClaims;
    mapping(address => uint256) public userStaking;
    mapping(address => mapping(uint256 => UserStake)) public userStakes;

    /* MODIFIER */
    modifier initializer() {
        require(initialized, "Initializer: This smart contract has not been initialized.");
        _;
    }

    // CONSTRUCTOR

    constructor() {
        router = IRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);

        (, uint256 exponentiation) = uint256(10).tryPow(36);
        rewardsPerStakeAccuracyFactor = exponentiation;
    }

    // EVENT

    event Staked(address indexed staker, uint256 amount);
    event Unstaked(address indexed staker, uint256 amount);

    // FUNCTION

    /**
     * @dev Accept native into smart contract.
     */
    receive() external payable {}

    /**
     * @dev Pause smart contract.
     */
    function pause() external whenNotPaused authorized {
        _pause();
    }
    
    /**
     * @dev Unpause smart contract.
     */
    function unpause() external whenPaused onlyOwner {
        _unpause();
    }

    /**
     * @dev Initialize smart contract.
     */
    function initializeContract(address penaltyReceiverAddress, address tokenAddress, address rewardTokenAddress) external onlyOwner {
        require(!initialized, "Initialize Contract: This smart contract has been initialized.");
        require(tokenAddress != ZERO, "Initialize Contract: Cannot set token address as null address.");
        require(tokenAddress != DEAD, "Initialize Contract: Cannot set token address as dead address.");
        require(Address.isContract(tokenAddress), "Initialize Contract: Please use smart contract for token address.");
        require(rewardTokenAddress != ZERO, "Initialize Contract: Cannot set reward token address as null address.");
        require(rewardTokenAddress != DEAD, "Initialize Contract: Cannot set reward token address as dead address.");
        require(Address.isContract(rewardTokenAddress), "Initialize Contract: Please use smart contract for reward token address.");
        require(penaltyReceiverAddress != ZERO, "Initialize Contract: Cannot set penalty receiver address as null address.");
        require(penaltyReceiverAddress != DEAD, "Initialize Contract: Cannot set penalty receiver address as dead address.");
        token = IERC20(tokenAddress);
        rewardToken = IERC20(rewardTokenAddress);
        penaltyReceiver = penaltyReceiverAddress;
        initialized = true;
    }

    /**
     * @dev Update to new router address.
     */
    function updateRouter(address newRouter) external authorized {
        require(newRouter != ZERO, "Update Router: Cannot set router as null address.");
        require(Address.isContract(newRouter), "Update Router: Please use smart contract address.");
        router = IRouter(newRouter);
    }

    /**
     * @dev Update to new penalty receiver address.
     */
    function updatePenaltyReceiver(address newReceiver) external authorized {
        require(newReceiver != ZERO, "Update Penalty Receiver: Cannot set penalty receiver as null address.");
        require(newReceiver != DEAD, "Update Penalty Receiver: Cannot set penalty receiver as dead address.");
        require(penaltyReceiver != newReceiver, "Update Penalty Receiver: Cannot set the same address.");
        penaltyReceiver = newReceiver;
    }

    /**
     * @dev Update penalty percentage.
     */
    function updatePenalty(uint256 numerator, uint256 denominator) external authorized {
        require(denominator > 0, "Update Penalty: Cannot set denominator as 0.");
        require(numerator <= denominator.mul(20).div(100), "Update Penalty: Penalty percentage should not be greater than 20%.");
        penaltyNumerator = numerator;
        penaltyDenominator = denominator;
    }

    /**
     * @dev Enable/disable user to trigger emergency withdraw.
     */
    function allowEmergencyWithdraw(bool allow) external authorized {
        require(emergencyWithdraw != allow, "Enable Emergency Withdraw: Cannot set the same state.");
        emergencyWithdraw = allow;
    }

    /**
     * @dev Allow user to stake their token.
     */
    function stake(uint256 amount) external initializer {
        if (stakes[_msgSender()].amount == 0) {
            addStaker(_msgSender());
            userStaking[_msgSender()] = 0;
        }

        uint256 unpaidEarning = handleDistribution(_msgSender(), amount);

        uint256 currentPrice = checkTokenPrice();

        uint256 index = userStaking[_msgSender()];
        updateStakeInfo(_msgSender(), index, amount, currentPrice, block.timestamp);

        userStaking[_msgSender()] = index.add(1);

        totalStaked = totalStaked.add(amount);
        stakes[_msgSender()].amount = stakes[_msgSender()].amount.add(amount);
        stakes[_msgSender()].totalExcluded = getCumulativeRewards(stakes[_msgSender()].amount);

        emit Staked(_msgSender(), amount);
        
        require(token.transferFrom(_msgSender(), address(this), amount), "Stake: There's something wrong with the transfer.");
        if (unpaidEarning > 0) {
            require(rewardToken.transfer(_msgSender(), unpaidEarning), "Stake: There's something wrong with the transfer.");
        }
    }

    /**
     * @dev Allow user to unstake their token.
     */
    function unstake(uint256 amount, uint256 index) external initializer {
        require(userStakes[_msgSender()][index].stakePrice <= checkTokenPrice(), "Unstake: Cannot unstake below token price when staked.");
        _unstake(amount, index, false);
    }

    /**
     * @dev Logic for unstaking.
     */
    function _unstake(uint256 amount, uint256 index, bool takePenalty) internal {
        require(index <= userStaking[_msgSender()], "Unstake: There no token staked at this index.");
        require(amount <= userStakes[_msgSender()][index].stakeAmount, "Unstake: Amount cannot exceed the total token staked at this index.");
        require(userStakes[_msgSender()][index].stakeAmount > 0, "Unstake: There's no stake token at this index.");

        uint256 unpaidEarning = handleDistribution(_msgSender(), amount);

        userStakes[_msgSender()][index].stakeAmount = userStakes[_msgSender()][index].stakeAmount.sub(amount);
        if (userStakes[_msgSender()][index].stakeAmount == 0) {
            updateStakeInfo(_msgSender(), index, 0, 0, 0);
            uint256 newStakeIndex = userStaking[_msgSender()].sub(1);
            userStakes[_msgSender()][index] = userStakes[_msgSender()][newStakeIndex];
            userStaking[_msgSender()] = newStakeIndex;
            updateStakeInfo(_msgSender(), newStakeIndex, 0, 0, 0);
        }

        totalStaked = totalStaked.sub(amount);
        stakes[_msgSender()].amount = stakes[_msgSender()].amount.sub(amount);
        stakes[_msgSender()].totalExcluded = getCumulativeRewards(stakes[_msgSender()].amount);

        if (stakes[_msgSender()].amount == 0) {
            removeStaker(_msgSender());
            userStaking[_msgSender()] = 0;
        }

        emit Unstaked(_msgSender(), amount);
        
        uint256 penaltyAmount = amount.mul(penaltyNumerator).div(penaltyDenominator);

        if (takePenalty) {
            require(token.transfer(_msgSender(), amount.sub(penaltyAmount)), "Unstake: There's something wrong with the transfer.");
            require(token.transfer(penaltyReceiver, penaltyAmount), "Unstake: There's something wrong with the penalty transfer.");
        } else {
            require(token.transfer(_msgSender(), amount), "Unstake: There's something wrong with the transfer.");
        }
        if (unpaidEarning > 0) {
            require(rewardToken.transfer(_msgSender(), unpaidEarning), "Unstake: There's something wrong with the transfer.");
        }
    }

    /**
     * @dev Allow user to emergency withdraw their staking.
     */
    function emergencyWithdrawStaking(uint256 amount, uint256 index) external initializer {
        require(emergencyWithdraw, "Emergency Withdraw: Emergency withdraw not allowed.");
        _unstake(amount, index, true);
    }

    /**
     * @dev Check current token price.
     */
    function checkTokenPrice() public view returns (uint256) {
        (, uint256 oneToken) = uint256(10).tryPow(token.decimals());
        
        address[] memory path = new address[](3);
        path[0] = address(token);
        path[1] = router.WETH();
        path[2] = address(USDT);

        uint256[] memory prices = router.getAmountsOut(oneToken, path);
        return prices[2];
    }

    /**
     * @dev Deposit BNB into contract to be swap into reward token.
     */
    function deposit() external payable {
        updateRewards();
        handleDeposits(_msgValue());
    }

    /**
     * @dev Allow funds stucked in smart contract to be used for rewards.
     */
    function depositStuckedBNB() external {
        uint256 amount = address(this).balance;
        updateRewards();
        handleDeposits(amount);
    }

    /**
     * @dev Handle deposits for rewards.
     */
    function handleDeposits(uint256 amount) internal {
        address[] memory path = new address[](2);
        path[0] = router.WETH();
        path[1] = address(rewardToken);

        uint256[] memory prices = router.getAmountsOut(amount, path);
        balanceSwapped = prices[1];

        router.swapExactETHForTokensSupportingFeeOnTransferTokens {
            value: amount
        } (0, path, address(this), block.timestamp);
    }

    /**
     * @dev Handle reward distribution.
     */
    function handleDistribution(address staker, uint256 amount) internal returns (uint256) {
        uint256 unpaidEarning = 0;

        if (stakes[staker].amount > 0) {
            unpaidEarning = getUnpaidEarnings(staker);
        }

        if (unpaidEarning > 0) {
            totalDistributed = totalDistributed.add(amount);
            stakerClaims[staker] = block.timestamp;
            stakes[staker].totalRealised = stakes[staker].totalRealised.add(amount);
            stakes[staker].totalExcluded = getCumulativeRewards(stakes[staker].amount);
        }

        return unpaidEarning;
    }

    /**
     * @dev Update staking information.
     */
    function updateStakeInfo(address staker, uint256 index, uint256 amount, uint256 price, uint256 time) internal {
        userStakes[staker][index].stakeAmount = amount;
        if (amount == 0) {
            userStakes[staker][index].stakePrice = 0;
            userStakes[staker][index].stakeTime = 0;
        } else {
            userStakes[staker][index].stakePrice = price;
            userStakes[staker][index].stakeTime = time;
        }
    }

    /**
     * @dev Trigger update for reward information.
     */
    function updateRewards() public {
        if (balanceSwapped > 0) {
            totalRewards = totalRewards.add(balanceSwapped);
            (, uint256 addition) = rewardsPerStakeAccuracyFactor.mul(balanceSwapped).tryDiv(totalStaked);
            rewardsPerStake = rewardsPerStake.add(addition);
            balanceSwapped = 0;
        }
    }

    /**
     * @dev Get the cumulative rewards for the given stake.
     */
    function getCumulativeRewards(uint256 staked) internal view returns (uint256) {
        return staked.mul(rewardsPerStake).div(rewardsPerStakeAccuracyFactor);
    }
    
    /**
     * @dev Get unpaid rewards that needed to be distributed for the given address.
     */
    function getUnpaidEarnings(address staker) public view returns (uint256) {
        if (stakes[staker].amount == 0) {
            return 0;
        }

        uint256 stakerTotalRewards = getCumulativeRewards(stakes[staker].amount);
        uint256 stakerTotalExcluded = stakes[staker].totalExcluded;

        if (stakerTotalRewards <= stakerTotalExcluded) {
            return 0;
        }

        return stakerTotalRewards.sub(stakerTotalExcluded);
    }

    /**
     * @dev Add the address to the array of stakers.
     */
    function addStaker(address staker) internal {
        stakerIndexes[staker] = stakers.length;
        stakers.push(staker);
    }

    /**
     * @dev Remove the address from the array of stakers.
     */
    function removeStaker(address staker) internal {
        stakers[stakerIndexes[staker]] = stakers[stakers.length - 1];
        stakerIndexes[stakers[stakers.length - 1]] = stakerIndexes[staker];
        stakers.pop();
    }

    /**
     * @dev Allow stakers to manually claim their rewards anytime they want.
     */
    function claimRewards() external {
        require(initialized, "Claim Rewards: This smart contract has not been initialized.");
        require(stakes[_msgSender()].amount == 0, "Claim Rewards: You have no rewards available to be claimed.");

        uint256 amount = getUnpaidEarnings(_msgSender());
        if (amount > 0) {
            totalDistributed = totalDistributed.add(amount);
            stakerClaims[_msgSender()] = block.timestamp;
            stakes[_msgSender()].totalRealised = stakes[_msgSender()].totalRealised.add(amount);
            stakes[_msgSender()].totalExcluded = getCumulativeRewards(stakes[_msgSender()].amount);
            require(rewardToken.transfer(_msgSender(), amount), "Distribute Rewards: There's something wrong with the transfer.");
        }
    }

}

contract ForcedToEarn is Auth, IERC20 {

    // LIBRARY

    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    // DATA

    Counters.Counter public totalStakingPool;

    IRouter public router;

    address private constant DEAD = address(0xdead);
    address private constant ZERO = address(0);

    uint256 private constant FEEDENOMINATOR = 10000;
    uint256 private constant MAX = type(uint256).max;

    string private constant NAME = "Forced To Earn";
    string private constant SYMBOL = "F2E";

    uint8 private constant DECIMALS = 18;
        
    uint256 private constant TOTALSUPPLY = 1_000_000_000 ether;

    uint256 public swapThreshold = TOTALSUPPLY.mul(5).div(1000);
    uint256 public liquidityFee = 0;
    uint256 public buybackFee = 0;
    uint256 public marketingFee = 0;
    uint256 public rewardFee = 0;
    uint256 public totalFee = 0;
    uint256 public targetLiquidity = 2500;
    uint256 public targetLiquidityDenominator = 10000;
    uint256 public lastAddLiquidityTime = 0;
    uint256 public autoBuybackCap = 0;
    uint256 public autoBuybackAccumulator = 0;
    uint256 public autoBuybackAmount = 0;
    uint256 public autoBuybackBlockPeriod = 0;
    uint256 public autoBuybackBlockLast = 0;
    uint256 public buybackMultiplierNumerator = 20000;
    uint256 public buybackMultiplierDenominator = 10000;
    uint256 public buybackMultiplierLength = 30 minutes;
    uint256 public buybackMultiplierTriggeredAt = 0;

    uint256[] public stakeDistributionPercentage = [8000, 2000];

    bool public autoAddLiquidity = false;
    bool public autoBuybackEnabled = false;
    bool public autoBuybackMultiplierEnabled = false;
    bool public inSwap = false;
    bool public swapEnabled = false;
    bool public presaleFinalized = false;

    address public pair;
    address public autoLiquidityReceiver;
    address public marketingReceiver;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    mapping(uint256 => address) public stakingReceiverAddress;
    mapping(address => uint256) public stakingReceiverIndex;
    mapping(address => bool) public stakingReceiver;
    mapping(address => bool) public isFeeExempt;

    // CONSTRUCTOR

    constructor(
        address firstReward,
        address secondReward,
        address autoLiquidity,
        address marketing
    ) {
        require(firstReward != ZERO, "Forced To Earn: Cannot set first reward receiver as null address.");
        require(firstReward != DEAD, "Forced To Earn: Cannot set first reward recceiver as dead address.");
        require(secondReward != ZERO, "Forced To Earn: Cannot set second reward receiver as null address.");
        require(secondReward != DEAD, "Forced To Earn: Cannot set second reward recceiver as dead address.");
        require(autoLiquidity != ZERO, "Forced To Earn: Cannot set auto liquidity receiver as null address.");
        require(autoLiquidity != DEAD, "Forced To Earn: Cannot set auto liquidity recceiver as dead address.");
        require(marketing != ZERO, "Forced To Earn: Cannot set marketing receiver as null address.");
        require(marketing != DEAD, "Forced To Earn: Cannot set marketing recceiver as dead address.");

        addStakingPool(firstReward);
        addStakingPool(secondReward);

        autoLiquidityReceiver = autoLiquidity;
        marketingReceiver = marketing;

        router = IRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        pair = IFactory(router.factory()).createPair(address(this), router.WETH());
        resetRouterAndPairAllowance();
        
        isFeeExempt[_msgSender()] = true;
        
        _balances[_msgSender()] = TOTALSUPPLY;

        emit Transfer(address(0), _msgSender(), TOTALSUPPLY);
    }

    // MODIFIER

    modifier swapping() {
        inSwap = true;
        _;
        inSwap = false;
    }

    // EVENT
    
    event BuybackMultiplierActive(uint256 duration);

    // FUNCTION

    /**
     * @dev Accept native into smart contract.
     */
    receive() external payable {}

    /**
     * @dev Initiate to set all required settings right after the presale was finalized.
     */
    function finalizePresale() external onlyOwner {
        require(!presaleFinalized, "Finalize Presale: Presale already finalized.");
        liquidityFee = 100;
        buybackFee = 200;
        marketingFee = 200;
        rewardFee = 500;
        totalFee = liquidityFee.add(buybackFee).add(marketingFee).add(rewardFee);
        autoAddLiquidity = true;
        swapEnabled = true;
        presaleFinalized = true;
    }

    /**
     * @dev Easy way to approve max allowance for the spender to use this token.
     */
    function approveMax(address spender) external returns (bool) {
        return approve(spender, MAX);
    }

    /**
     * @dev Reset pair and router allowance.
     */
    function resetRouterAndPairAllowance() public {
        _allowances[address(this)][address(router)] = MAX;
        _allowances[address(this)][address(pair)] = MAX;
    }

    /**
     * @dev Update to new router.
     */
    function updateRouter(address newRouter) external authorized {
        require(newRouter != ZERO, "Update Router: Cannot set router as null address.");
        require(Address.isContract(newRouter), "Update Router: Please use smart contract address.");
        _allowances[address(this)][address(router)] = 0;
        _allowances[address(this)][address(pair)] = 0;

        router = IRouter(newRouter);
        pair = IFactory(router.factory()).createPair(address(this), router.WETH());
    }

    // ERC20 related functions.
    
    /**
     * @dev ERC20 standard: Display token name.
     */
    function name() external pure returns (string memory) {
        return NAME;
    }
    
    /**
     * @dev ERC20 standard: Display token symbol.
     */
    function symbol() external pure returns (string memory) {
        return SYMBOL;
    }
    
    /**
     * @dev ERC20 standard: Display token decimals.
     */
    function decimals() external pure returns (uint8) {
        return DECIMALS;
    }
    
    /**
     * @dev ERC20 standard: Display token total supply.
     */
    function totalSupply() external pure returns (uint256) {
        return TOTALSUPPLY;
    }
    
    /**
     * @dev ERC20 standard: Display token balance of an address.
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    
    /**
     * @dev ERC20 standard: Approve allowance for an address.
     */
    function approve(address spender, uint256 amount) public returns (bool) {
        address provider = _msgSender();
        _approve(provider, spender, amount);
        return true;
    }

    /**
     * @dev Logic for approving allowance based on OpenZepplin.
     */
    function _approve(address provider, address spender, uint256 amount) internal {
        require(provider != ZERO, "Approve: Approve from the null address.");
        require(spender != ZERO, "Approve: Approve to the null address.");

        _allowances[provider][spender] = amount;
        emit Approval(provider, spender, amount);
    }
    
    /**
     * @dev ERC20 standard: Display token allowance for given addresses.
     */
    function allowance(address provider, address spender) public view returns (uint256) {
        return _allowances[provider][spender];
    }

    /**
     * @dev Logic for spending allowance based on OpenZepplin.
     */
    function _spendAllowance(address provider, address spender, uint256 amount) internal {
        uint256 currentAllowance = allowance(provider, spender);
        if (currentAllowance != MAX) {
            require(currentAllowance >= amount, "Spend Allowance: Insufficient allowance.");
            unchecked {
                _approve(provider, spender, currentAllowance.sub(amount));
            }
        }
    }
    
    /**
     * @dev Logic for increasing allowance based on OpenZepplin.
     */
    function increaseAllowance(address spender, uint256 addedValue) external returns (bool) {
        address provider = _msgSender();
        _approve(provider, spender, allowance(provider, spender).add(addedValue));
        return true;
    }

    /**
     * @dev Logic for decreasing allowance based on OpenZepplin.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool) {
        address provider = _msgSender();
        uint256 currentAllowance = allowance(provider, spender);
        require(currentAllowance >= subtractedValue, "Decreased Allowance: Decreased allowance below zero.");
        unchecked {
            _approve(provider, spender, currentAllowance.sub(subtractedValue));
        }

        return true;
    }

    /**
     * @dev ERC20 standard: Allow token transfer.
     */
    function transfer(address to, uint256 amount) public returns (bool) {
        address from = _msgSender();
        require(_transfer(from, to, amount), "Transfer: There's an issue with the transaction.");
        return true;
    }

    /**
     * @dev ERC20 standard: Allow token transfer from a given address.
     */
    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        require(_transfer(from, to, amount), "Transfer From: There's an issue with the transaction.");
        return true;
    }

    /**
     * @dev Modified logic for token transfer based on OpenZepplin for the purpose of this project.
     */
    function _transfer(address from, address to, uint256 amount) internal returns (bool) {
        require(from != ZERO, "Transfer: Transfer from the null address.");
        require(to != ZERO, "Transfer: Transfer to the null address.");

        if (inSwap) {
            return _basicTransfer(from, to, amount);
        }

        if (shouldSwapBack()) {
            swapBack();
        }

        uint256 amountReceived = shouldTakeFee(from, to) ? takeFee(from, to, amount) : amount;

        unchecked {
            _balances[from] = _balances[from].sub(amountReceived, "Transfer: Transfer amount exceeds balance.");
            _balances[to] = _balances[to].add(amountReceived);
        }

        emit Transfer(from, to, amount);

        return true;
    }

    /**
     * @dev Logic for basic token transfer based on ERC20 standard.
     */
    function _basicTransfer(address from, address to, uint256 amount) internal returns (bool) {
        _balances[from] = _balances[from].sub(amount, "Basic Transfer: Insufficient balance.");
        _balances[to] = _balances[to].add(amount);
        emit Transfer(from, to, amount);
        return true;
    }

    // Check functions

    /**
     * @dev Check the amount of circulating supply.
     */
    function getCirculatingSupply() public view returns (uint256) {
        return TOTALSUPPLY.sub(balanceOf(DEAD)).sub(balanceOf(ZERO));
    }

    /**
     * @dev Check if should take fee.
     */
    function shouldTakeFee(address sender, address receiver) internal view returns (bool) {
        bool senderFee = sender == address(router) || sender == address(pair) || sender == address(this);
        bool receiverFee = receiver == address(router) || receiver == address(pair) || receiver == address(this);
        if (senderFee && receiverFee) {
            return false;
        } else if (senderFee && isFeeExempt[receiver] && !receiverFee) {
            return false;
        } else if (!senderFee && !receiverFee) {
            return false;
        } else if (!senderFee && isFeeExempt[sender] && receiverFee) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @dev Check if should trigger swap back.
     */
    function shouldSwapBack() internal view returns (bool) {
        return _msgSender() != pair && !inSwap && swapEnabled && _balances[address(this)] >= swapThreshold;
    }
    
    /**
     * @dev Check if should trigger add liquidity.
     */
    function shouldAddLiquidity() internal view returns (bool) {
        return autoAddLiquidity && !inSwap && _msgSender() != pair;
    }

    /**
     * @dev Check if should trigger auto buyback.
     */
    function shouldAutoBuyback() internal view returns (bool) {
        return _msgSender() != pair && !inSwap && autoBuybackEnabled && autoBuybackBlockLast.add(autoBuybackBlockPeriod) <= block.number && address(this).balance >= autoBuybackAmount;
    }

    /**
     * @dev Check if the luquidity pool is currently over liquified.
     */
    function isOverLiquified(uint256 accuracy, uint256 target) internal view returns (bool) {
        (bool overliquified, ) = SafeMath.trySub(getLiquidityBacking(accuracy), target);
        return overliquified;
    } 

    // Staking pool related functions.

    /**
     * @dev Add the address for staking pool.
     */
    function addStakingPool(address stakingPool) public authorized {
        require(!stakingReceiver[stakingPool], "Add Staking Pool: This address is already in the staking pool list.");
        require(Address.isContract(stakingPool), "Add Staking Pool: Please use smart contract address.");
        
        totalStakingPool.increment();
        uint256 poolID = totalStakingPool.current();

        stakingReceiverAddress[poolID] = stakingPool;
        stakingReceiverIndex[stakingPool] = poolID;
        stakingReceiver[stakingPool] = true;
        isFeeExempt[stakingPool] = true;
    }

    /**
     * @dev Remove the address from staking pool.
     */
    function removeStakingPool(address stakingPool) external authorized {
        require(stakingReceiver[stakingPool], "Remove Staking Pool: This address is not in the staking pool list.");
        
        uint256 poolID = stakingReceiverIndex[stakingPool];
        uint256 lastPoolID = totalStakingPool.current();

        stakingReceiverIndex[stakingPool] = 0;
        stakingReceiverAddress[poolID] = stakingReceiverAddress[lastPoolID];
        stakingReceiver[stakingPool] = false;
        isFeeExempt[stakingPool] = false;
        
        stakingReceiverIndex[stakingReceiverAddress[lastPoolID]] = poolID;
        stakingReceiverAddress[lastPoolID] = ZERO;

        totalStakingPool.decrement();
    }

    /**
     * @dev Update the setting for reward distribution.
     */
    function updatePoolPercentage(uint256[] memory percentages) external authorized {
        require(percentages.length == totalStakingPool.current(), "Update Pool Percentage: Percentage array should be the exact same size as the pool count.");

        uint256 loops = 0;
        uint256 totalPercentage = 0;

        while (loops < totalStakingPool.current()) {
            totalPercentage = totalPercentage.add(percentages[loops]);
            loops++;
        }

        require(totalPercentage == FEEDENOMINATOR, "Update Pool Percentage: Total distribution percentages should add up to 100%");

        stakeDistributionPercentage = percentages;
    }

    /**
     * @dev Logic to distribution reward to staking pool.
     */
    function distributeStakingSwap(uint256 rewardAmount) internal {
        uint256 poolCount = totalStakingPool.current();

        if (poolCount == 0) {
            return;
        }

        uint256 iterations = 0;

        while (iterations < poolCount) {
            iterations++;
            swapStaking(stakingReceiverAddress[iterations], rewardAmount.mul(stakeDistributionPercentage[iterations.sub(1)]).div(FEEDENOMINATOR));
        }
    }

    // Fee related functions.

    /**
     * @dev Set the new auto liquidity fee receiver.
     */
    function setAutoLiquidityFeeReceiver(address newReceiver) external authorized {
        require(autoLiquidityReceiver != newReceiver, "Set Auto Liquidity Fee Receiver: Cannot set the same address.");
        autoLiquidityReceiver = newReceiver;
    }

    /**
     * @dev Set the new marketing fee receiver.
     */
    function setMarketingFeeReceiver(address newReceiver) external authorized {
        require(marketingReceiver != newReceiver, "Set Marketing Fee Receiver: Cannot set the same address.");
        marketingReceiver = newReceiver;
    }

    /**
     * @dev Set isFeeExempt boolean for the given address.
     */
    function setIsFeeExempt(address holder, bool exempt) external authorized {
        isFeeExempt[holder] = exempt;
    }

    /**
     * @dev Get current total fee, whether normal or multiplied.
     */
    function getTotalFee(bool selling) public view returns (uint256) {
        if (selling) {
            return getMultipliedFee();
        }
        return totalFee;
    }

    /**
     * @dev Check the fee amount in case multiplied fee currently being used.
     */
    function getMultipliedFee() public view returns (uint256) {
        (bool useMultipliedFee, uint256 remainingTime) = SafeMath.trySub(buybackMultiplierTriggeredAt.add(buybackMultiplierLength), block.timestamp);
        if (useMultipliedFee) {
            uint256 feeIncrease = totalFee.mul(buybackMultiplierNumerator).div(buybackMultiplierDenominator).sub(totalFee);
            return totalFee.add(feeIncrease.mul(remainingTime).div(buybackMultiplierLength));
        }
        return totalFee;
    }

    /**
     * @dev Handle taking fee from the transfer amount.
     */
    function takeFee(address sender, address receiver, uint256 amount) internal returns (uint256) {
        uint256 feeAmount = amount.mul(getTotalFee(receiver == pair)).div(FEEDENOMINATOR);

        _balances[address(this)] = _balances[address(this)].add(feeAmount);
        emit Transfer(sender, address(this), feeAmount);

        return amount.sub(feeAmount);
    }

    // Swapback related functions.

    /**
     * @dev Set the settings for swap back.
     */
    function setSwapBackSettings(bool enabled, uint256 amount) external authorized {
        swapEnabled = enabled;
        swapThreshold = amount;
    }

    /**
     * @dev Check distribution for swap back.
     */
    function swapDistribution(uint256 amountBNB, uint256 totalBNBFee, uint256 dynamicLiquidityFee) internal view returns (uint256, uint256, uint256) {
        uint256 amountBNBLiquidity = amountBNB.mul(dynamicLiquidityFee).div(totalBNBFee).div(2);
        uint256 amountBNBMarketing = amountBNB.mul(marketingFee).div(totalBNBFee);
        uint256 amountBNBReward = amountBNB.mul(rewardFee).div(totalBNBFee);
        return (amountBNBMarketing, amountBNBReward, amountBNBLiquidity);
    }

    /**
     * @dev Handle swap back.
     */
    function swapBack() internal swapping returns(bool) {        
        uint256 dynamicLiquidityFee = isOverLiquified(targetLiquidityDenominator, targetLiquidity) ? 0 : liquidityFee;
        uint256 amountToken = swapThreshold.mul(dynamicLiquidityFee).div(totalFee).div(2);
        uint256 amountToSwap = swapThreshold;
        bool liquid = shouldAddLiquidity();
        if (liquid) {
            amountToSwap = amountToSwap.sub(amountToken);
        }

        if (shouldAutoBuyback()) {
            autoBuybackBlockLast = block.number;
            autoBuybackAccumulator = autoBuybackAccumulator.add(autoBuybackAmount);
            if (autoBuybackAccumulator > autoBuybackCap) {
                autoBuybackEnabled = false;
            }
            _buyback(autoBuybackAmount, autoBuybackMultiplierEnabled);
        }

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = router.WETH();
        uint256 balanceBefore = address(this).balance;
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(amountToSwap, 0, path, address(this), block.timestamp);
        uint256 amountBNB = address(this).balance.sub(balanceBefore);

        uint256 totalBNBFee = totalFee;

        if (liquid) {
            totalBNBFee = totalBNBFee.sub(dynamicLiquidityFee.div(2));
        } else {
            totalBNBFee = totalBNBFee.sub(liquidityFee);
        }
        
        (uint256 amountBNBMarketing, uint256 amountBNBReward, uint256 amountBNBLiquidity) = swapDistribution(amountBNB, totalBNBFee, dynamicLiquidityFee);

        payable(marketingReceiver).transfer(amountBNBMarketing);
        
        distributeStakingSwap(amountBNBReward);

        if (liquid) {
            (uint256 liquidityToken, , ) = router.addLiquidityETH{
                value: amountBNBLiquidity
            } (address(this), amountToken, 0, 0, autoLiquidityReceiver, block.timestamp);
            (bool added, ) = liquidityToken.trySub(0);
            return added;
        }

        return true;
    }

    /**
     * @dev Staking swap logic.
     */
    function swapStaking(address rewardReceiver, uint256 amount) internal {
        require(msg.sender != rewardReceiver, "Swap Staking: Reward Receiver cannot call this function.");

        try IStaking(rewardReceiver).deposit {
            value: amount
        } () {} catch {}

        try IStaking(rewardReceiver).updateRewards() {} catch {}

    }
    
    // Liquidity related functions

    /**
     * @dev Get liquidity backing.
     */
    function getLiquidityBacking(uint256 accuracy) public view returns (uint256) {
        return accuracy.mul(balanceOf(pair).mul(2)).div(getCirculatingSupply());
    }

    /**
     * @dev Set the status for add liquidity automation.
     */
    function setAutoAddLiquidity(bool flag) external authorized {
        if(flag) {
            autoAddLiquidity = flag;
            lastAddLiquidityTime = block.timestamp;
        } else {
            autoAddLiquidity = flag;
        }
    }

    /**
     * @dev Set settings for target liquidity.
     */
    function setTargetLiquidity(uint256 target, uint256 denominator) external authorized {
        require(denominator >= target, "Set Target Liquidity: Target Liquidity should be lower or equal to Target Liquidity Denominator .");
        targetLiquidity = target;
        targetLiquidityDenominator = denominator;
    }

    // Buyback related functions

    /**
     * @dev Allow buyback and burn the token using funds stucked in smart contract.
     */
    function triggerManualBuyback(uint256 amount, bool triggerBuybackMultiplier) external authorized {
        _buyback(amount, triggerBuybackMultiplier);
    }

    /**
     * @dev Buyback and burn logic.
     */
    function _buyback(uint256 amount, bool triggerBuybackMultiplier) internal {
        require(msg.sender != DEAD, "Trigger Manual Buyback: Caller cannot be the receiver.");

        if (triggerBuybackMultiplier) {
            buybackMultiplierTriggeredAt = block.timestamp;
            emit BuybackMultiplierActive(buybackMultiplierLength);
        }
        
        address[] memory path = new address[](2);
        path[0] = router.WETH();
        path[1] = address(this);

        router.swapExactETHForTokensSupportingFeeOnTransferTokens {
            value: amount
        } (0, path, DEAD, block.timestamp);
    }

    /**
     * @dev Set the settings for buyback automation.
     */
    function setAutoBuybackSettings(bool enabled, bool multiplier, uint256 cap, uint256 amount, uint256 period) external authorized {
        autoBuybackEnabled = enabled;
        autoBuybackMultiplierEnabled = multiplier;
        autoBuybackCap = cap;
        autoBuybackAccumulator = 0;
        autoBuybackAmount = amount;
        autoBuybackBlockPeriod = period;
        autoBuybackBlockLast = block.number;
    }

    /**
     * @dev Set the settings for buyback multiplier.
     */
    function setBuybackMultiplierSettings(uint256 numerator, uint256 denominator, uint256 length) external authorized {
        require(numerator / denominator <= 2 && numerator > denominator);
        buybackMultiplierNumerator = numerator;
        buybackMultiplierDenominator = denominator;
        buybackMultiplierLength = length;
    }

    /**
     * @dev Clear buyback multiplier.
     */
    function clearBuybackMultiplier() external authorized {
        buybackMultiplierTriggeredAt = 0;
    }

}
