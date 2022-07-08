import React from "react";

export default class OrderCard extends React.Component {
  render () {
    var styles = {
      backgroundColor: `${this.props.order.background_color}`
    };
    return (
      <div className="col-md-3 p-0-5 clickable ">
        <div className="card text-white card-queue vw-100 vh-100" style={styles}>
          <div className="card-body p-3 text-white">
            <h4 className="my-0 text-white float-left">{this.props.order.coffee_bean}</h4>
            <h4 className="my-0 text-white float-right">4</h4>
            <br/>
            <center className="counter">
              <h1 className="queuing-number text-white mt-2">4</h1>
              <div className="timerOrderId-4">
                <p className="counter-time text-white d-inline timeminutes-4">10</p>
                <p className="counter-time text-white d-inline">:</p>
                <p className="counter-time text-white d-inline timeseconds-4">4</p>
              </div>
            </center>
            <div className="float-right"> <p className="text-white mb-0 h3">Vietnam Drip</p></div>
          </div>
        </div>
      </div>
    );
  }
}


