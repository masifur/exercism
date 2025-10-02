// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() {
  40
}
// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(spent: Int){
  expected_minutes_in_oven() - spent
}
// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(preparation_time: Int) {
  preparation_time * 2
}
// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(layer_count: Int, oven_time: Int) {
  preparation_time_in_minutes(layer_count) + oven_time
}
// Please define the alarm function
pub fn alarm() {
  "Ding!"
}
