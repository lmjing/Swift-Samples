/*
 * Enum, Association
 * 저장 프로퍼티 대신 연관하는 방식으로 값을 저장할 수 있음
 */

enum ArrivalStatus {
   case OnTime
   case Dalay(Int)
}

var flight = ArrivalStatus.Dalay(1)


switch flight {
case .OnTime:
   print("제때 도착")
case .Dalay(let hour):
   print("지연 시각 \(hour)")
}
