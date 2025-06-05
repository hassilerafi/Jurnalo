import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Iter "mo:base/Iter";
import Time "mo:base/Time";
import Text "mo:base/Text";
import Hash "mo:base/Hash";

actor {

  type Entry = {
    id: Nat;
    title: Text;
    body: Text;
    timestamp: Int; // gunakan Int supaya bisa simpan Time.now()
  };

  var lastId : Nat = 0;

  // Fungsi hash untuk Nat, kembalikan Hash.Hash (alias Nat32)
  func natHash(n: Nat) : Hash.Hash {
    Nat32.fromNat(n)
  };

  // Inisialisasi HashMap dengan kapasitas awal Nat (bukan Nat32)
  var entries = HashMap.HashMap<Nat, Entry>(10, Nat.equal, natHash);

  public shared func addEntry(e : { title: Text; body: Text }) : async Entry {
    lastId += 1;
    let now = Time.now();
    let newEntry : Entry = {
      id = lastId;
      title = e.title;
      body = e.body;
      timestamp = now;
    };
    entries.put(lastId, newEntry);
    return newEntry;
  };

  public query func getAllEntries() : async [Entry] {
    Iter.toArray(entries.vals())
  };

  public shared func deleteEntry(id: Nat) : async () {
    entries.delete(id);
  };

  public shared func editEntry(id: Nat, updated : { title: Text; body: Text }) : async () {
    switch (entries.get(id)) {
      case (null) {};
      case (?entry) {
        let newEntry : Entry = {
          id = entry.id;
          title = updated.title;
          body = updated.body;
          timestamp = Time.now();
        };
        entries.put(id, newEntry);
      };
    };
  };

};
