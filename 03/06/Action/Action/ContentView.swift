import SwiftUI

struct ContentView {
  let increments = [1, 2, 3, 5, 10]
  @State private var currentValue = 0
  @State private var incrementIndex = 0
  @State private var increment = 10
  @State private var horizontalSpace = 0.0
}

extension ContentView: View {
  var body: some View {
    VStack (spacing: 30) {
      IntDisplay(value: currentValue)
      HStack (spacing: horizontalSpace) {
        SymbolButton("arrow.left",
                     action: back)
        SymbolButton("arrow.right",
                     action: forward)
      }
      Picker("Choose the increment",
             selection: $incrementIndex) {
        ForEach(increments.indices) { index in
          Text("by \(increments[index])")
        }
      }
      .pickerStyle(.segmented)
      .padding()
    }
  }
}

extension ContentView {
  private func back() {
    currentValue -= increments[incrementIndex]
  }
  private func forward() {
    currentValue += increments[incrementIndex]
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
