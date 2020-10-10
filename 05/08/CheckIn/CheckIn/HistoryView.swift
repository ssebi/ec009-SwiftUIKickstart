import SwiftUI

struct HistoryView {
  @ObservedObject var history: History
}

extension HistoryView: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(history.snapshots){snapshot in
          NavigationLink(destination:
                          DestinationView(snapshot: snapshot)
                          .navigationBarTitle(symbol(snapshot.rating))){
            HStack(spacing: 20) {
              Text("Rating: \(snapshot.rating)")
              Text(snapshot.date,
                   style: .time)
                .foregroundColor(.secondary)
            }
            
          }
        }
        .onDelete(perform: history.remove)
      }
      .navigationBarTitle("Ratings")
      .navigationBarItems(trailing: EditButton())
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(history: History())
  }
}
