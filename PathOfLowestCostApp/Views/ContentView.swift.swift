import SwiftUI

struct ContentView: View {
    @State private var rows: String = ""
    @State private var columns: String = ""
    @State private var gridInput: String = ""
    @State private var resultText: String = ""
    @State private var totalCostText: String = ""
    @State private var pathText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter number of rows:")
            TextField("Enter rows", text: $rows)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Enter number of columns:")
            TextField("Enter columns", text: $columns)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Enter grid values separated by space:")
            TextField("Enter grid", text: $gridInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                let gridValues = parseGridValues()
                let grid = Grid(gridValues)
                let (pathExists, totalCost, path) = grid.findLowestCostPath()
                
                if pathExists {
                    resultText = "Yes"
                    totalCostText = "Total Cost: \(totalCost)"
                    pathText = "Path: \(path.map(String.init).joined(separator: " "))"
                } else {
                    resultText = "No"
                    totalCostText = "Total Cost: \(totalCost)"
                    pathText = "Path: \(path.map(String.init).joined(separator: " "))"
                }
            }) {
                Text("Find Lowest Cost Path")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            
            Text(resultText)
            Text(totalCostText)
            Text(pathText)
            
            Spacer()
        }
        .padding()
    }
    
    private func parseGridValues() -> [[Int]] {
        let rowsArray = gridInput.components(separatedBy: "\n")
        var gridValues = [[Int]]()
        
        for rowString in rowsArray {
            let rowValues = rowString.split(separator: " ").compactMap { Int($0) }
            gridValues.append(rowValues)
        }
        
        return gridValues
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
