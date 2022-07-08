import React from "react"
import axios from "axios";
import OrderCard from './OrderCard'

export default class OrderList extends React.Component {
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
        <OrderCard 
          order={order.attributes} 
          key={order.id}
        />
      );
    });
  }
}

