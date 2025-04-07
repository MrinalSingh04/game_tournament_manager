# 🎮 Game Tournament Manager Smart Contract

---

## 🧠 What is it?

**GameTournamentManager** is a smart contract that allows users to create and manage gaming tournaments on the blockchain. Players can register for tournaments by paying a predefined entry fee, and once the tournament ends, the organizer can reward the winner with the total prize pool — all done in a transparent, decentralized manner.

This smart contract is ideal for gaming platforms or dApps that want to host small-scale community tournaments in a trustless way.

---

## ❓ Why build this?

Traditional online gaming tournaments often rely on **centralized platforms** where:

- The organizer controls prize distribution.
- There’s little transparency around who joined, how much money was collected, or how rewards were handled.
- Trust between organizers and players is essential, which can be risky or discouraging for small communities.

**This contract solves all that** by:

- Ensuring **entry fees are stored securely** on-chain.
- Automating **prize distribution** to the winner.
- Making all activity **public and transparent** on the blockchain.
- Giving developers a base to build real-world Web3 gaming apps.

---

## ⚙️ Features

### 🛠 Tournament Creation

- Only the contract **owner** (typically the gaming platform admin) can create new tournaments.
- Requires a `name` and an `entryFee` in wei.

### 👥 Player Registration

- Players register by sending exactly the `entryFee` in ETH.
- Registered addresses are stored in a public array.

### 🏆 Ending a Tournament

- Only the owner can end the tournament.
- Owner specifies the winner’s address.
- Automatically calculates and transfers the **entire prize pool** to the winner.

### 📄 View Functions

- Anyone can view the list of registered players for a tournament.

---

## 🧩 Contract Structure

| Function           | Description                                                |
| ------------------ | ---------------------------------------------------------- |
| `createTournament` | Owner creates a new tournament with a name & entry fee.    |
| `register`         | Players register by paying the entry fee.                  |
| `endTournament`    | Owner ends the tournament and sends all ETH to the winner. |
| `getPlayers`       | View list of players in a given tournament.                |

---

## 🔐 Security Notes

- Winner is **manually selected** by the owner — this assumes fair play or could be connected to off-chain validation like match results.
- Consider adding features like:
  - NFT/POAP minting for participants
  - DAO-based voting for winners
  - Oracles to fetch off-chain results
- Withdrawals are auto-handled; no leftover ETH stays stuck in the contract.

---

## 📜 License

MIT

---

## 🙌 Built as part of Day 58 of the #100DaysOfCode challenge

Follow the journey: [your_twitter_or_linkedin_here]
