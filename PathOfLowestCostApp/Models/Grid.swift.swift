import Foundation

struct Grid {
    let rows: Int
    let columns: Int
    let values: [[Int]]

    init(_ values: [[Int]]) {
        self.values = values
        self.rows = values.count
        self.columns = values[0].count
    }

    func isValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    func findLowestCostPath() -> (Bool, Int, [Int]) {
        var minCost = Int.max
        var path: [Int] = []
        var found = false

        // Start traversing from each row
        for row in 0..<rows {
            var currentRow = row
            var currentColumn = 0
            var totalCost = 0
            var currentPath: [Int] = []

            while currentColumn < columns {
                totalCost += values[currentRow][currentColumn]
                currentPath.append(currentRow + 1) // Adding 1 to row index to make it 1-indexed

                // If cost exceeds the limit, break the loop
                if totalCost > 50 {
                    break
                }

                // Move to the next column
                currentColumn += 1

                // Wrap around the grid if needed
                if currentColumn == columns {
                    currentColumn = 0
                }

                // Check if the path reached the end
                if currentColumn == 0 {
                    if totalCost < minCost {
                        minCost = totalCost
                        path = currentPath
                        found = true
                    }
                    break
                }

                // Check all possible moves
                let moves = [(0, 0), (-1, 0), (1, 0), (-1, -1), (1, -1), (-1, 1), (1, 1)]
                var nextRow = -1

                for move in moves {
                    let newRow = currentRow + move.0
                    let newColumn = currentColumn + move.1

                    if isValid(row: newRow, column: newColumn) {
                        if nextRow == -1 || values[newRow][newColumn] < values[nextRow][currentColumn] {
                            nextRow = newRow
                        }
                    }
                }

                // Update the row for the next move
                currentRow = nextRow
            }
        }

        return (found, minCost, path)
    }
}
