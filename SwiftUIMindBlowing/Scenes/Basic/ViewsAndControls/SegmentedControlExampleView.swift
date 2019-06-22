//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SwiftUI

struct SegmentedControlExampleView : View {

    @State var index1 = 0
    @State var index2 = 0
    let uiStacks = ["UIKit", "UIKit for Mac", "SwiftUI"]

    var body: some View {
        VStack {
            // Use binding to display value of array in a Text element
            SegmentedControl(selection: $index1) {
                ForEach(0..<self.uiStacks.count) { index1 in
                    Text(self.uiStacks[index1])
                }
            }
            Text("\(index1) - \(uiStacks[index1])")

            Divider()

            // Display custom view depending on the selected index of the SegmentedControl
            SegmentedControl(selection: $index2) {
                ForEach(0..<uiStacks.count) { index2 in
                    Text(self.uiStacks[index2])
                }
            }

            if index2 == 0 {
                CustomView1()
            } else if index2 == 1 {
                CustomView2()
            } else if index2 == 2 {
                CustomView3()
            }
        }
        .navigationBarTitle(Text("SegmentedControl"))
        .padding()

    }
}

private struct CustomView1: View {

    var body: some View {
        Text("UIKit View")
    }
}

private struct CustomView2: View {

    var body: some View {
        Text("UIKit for Mac View")
    }
}

private struct CustomView3: View {

    var body: some View {
        Text("Swift View")
    }
}

#if DEBUG
struct SegmentedControlExampleView_Previews : PreviewProvider {
    static var previews: some View {
        SegmentedControlExampleView()
    }
}
#endif