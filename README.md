# 📘 Jurnalo

**Jurnalo** is a simple personal journaling app built on the [Internet Computer](https://dfinity.org/) using **Motoko** for the backend and **React** for the frontend.

Users can add, edit, and delete journal entries. Each entry consists of a title, body text, and a timestamp. This app serves as an introductory project to building decentralized applications (dApps) on the Internet Computer platform.

---

## 🚀 Features

- 📝 Add new journal entries
- 🔄 Edit existing entries
- 🗑️ Delete entries
- 📅 View entries with human-readable timestamps
- 💾 Persistent data stored on the Internet Computer using Motoko

---

## 🧱 Tech Stack

| Layer       | Technology             |
|-------------|------------------------|
| Frontend    | React (Vite) + HTML/CSS |
| Backend     | Motoko (DFINITY canister) |
| Deployment  | Local replica or Internet Computer |

---

## 📂 Project Structure
```
jurnalo/
├── .devcontainer/ # VS Code devcontainer config (optional)
├── backend/ # Motoko backend canister code
│ └── main.mo
├── frontend/ # React frontend
│ ├── index.html
│ ├── src/
│ └── main.jsx
├── README.md
└── dfx.json # DFINITY project config
```

---

## 🛠️ Development Instructions

### Prerequisites

- [Node.js](https://nodejs.org/) (v16 or newer)
- [DFX SDK](https://smartcontracts.org/docs/quickstart/quickstart-intro.html) (latest version)
- [Vite](https://vitejs.dev/) (bundler for frontend)

### 1. Install dependencies
```
npm install
```

### 2. Start the DFINITY local replica
```
dfx start --background
```

### 3. Deploy the canister
```
dfx deploy
```

### 4. Start the frontend
```
cd frontend
npm run dev
```

---

## 📦 Build for Production
To build the frontend for production:
```
cd frontend
npm run build
```
The compiled assets will be located in the `dist/` folder.

---

## 🧠 Backend: Motoko Canister
The backend is written in Motoko and manages a list of journal entries.
Each entry is stored as a record:

```
type Entry = {
  id : Nat;
  title : Text;
  body : Text;
  timestamp : Int;
};
```

The canister exposes methods to:
- `addEntry`
- `getEntries`
- `updateEntry`
- `deleteEntry`

---

## 📄 License
MIT License. Feel free to modify and use this project for learning or experimentation.

---

## 🙌 Acknowledgements
- [DFINITY Foundation](https://dfinity.org/)
- [Motoko Language](https://internetcomputer.org/docs/current/motoko/main/motoko)
- [Vite](https://vitejs.dev/)
