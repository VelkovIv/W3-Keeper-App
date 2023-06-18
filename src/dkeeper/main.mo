import List "mo:base/List";
import Text "mo:base/Text";
import Debug "mo:base/Debug";


actor DKeeper{

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

      notes:= List.push(newNote, notes);
      // Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note] {
      return List.toArray(notes);
  };

  public func removeNote(id: Nat) {
    
    let leftPart = List.take(notes, id);
    let rightPart = List.drop(notes, id + 1);
    notes:= List.append(leftPart, rightPart);
    Debug.print(debug_show(notes));
    
  }

};
