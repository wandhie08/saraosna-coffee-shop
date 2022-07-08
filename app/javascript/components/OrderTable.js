import React from "react"


export default class OrderTable extends React.Component {
  render () {
    var styles = {
      backgroundColor: `${this.props.order.background_color}`
    };
    return (
      <tr class="text-white clickable" data-target="orderId1" id="table-order-id-1" style={styles}>
        <td class="text-center">1</td>
        <td>{this.props.order.coffee_bean}<br/>{this.props.order.serving_type}</td>
        <td class="text-center">{this.props.order.queue_number}</td>
        <td class="text-center">
          <div class="timerOrderId-1">
            <p class="counter-time text-white d-inline timeminutes-1">46</p>
            <p class="counter-time text-white d-inline">:</p>
            <p class="counter-time text-white d-inline timeseconds-1">40</p>
          </div>
        </td>
      </tr>
    );
  }
}


