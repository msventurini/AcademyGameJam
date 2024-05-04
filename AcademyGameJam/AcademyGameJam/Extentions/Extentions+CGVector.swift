import CoreGraphics

extension CGVector {
    func hasPositiveComponent() -> Bool {
        return dx > 0 || dy > 0
    }
}
