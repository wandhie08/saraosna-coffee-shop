import React from "react"
import axios from "axios";
import OrderTable from "./OrderTable";


export default class OrderTableList extends React.Component {
  state = { orders: [] };
  
  componentDidMount() {
    axios.get(`/api/orders`)
      .then(res => {
        const orders = res.data.data;
        this.setState({ orders });
      })
  }

  render() {
    return this.state.orders.map(order => {
      return(
        <OrderTable 
          order={order.attributes} 
          key={order.id}
        />
      );
    });
  }
}

 
