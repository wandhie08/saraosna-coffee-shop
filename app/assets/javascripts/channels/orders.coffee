App.room = App.cable.subscriptions.create "OrdersChannel",
  connected: ->
    console.log('web socket connected');
    $.notify {
      title: ''
      icon: 'fas fa-bell'
      showProgressbar: true
      animate:
        enter: 'animated fadeInDown'
        exit: 'animated fadeOutUp'
      message: 'Socket Connected'
    },
      element: 'body'
      type: 'success'
      allow_dismiss: true
      delay: 1000
      placement:
        from: 'bottom'
        align: 'right'

  disconnected: ->
    $.notify {
      title: 'Failed: '
      icon: 'fas fa-bell'
      showProgressbar: true
      animate:
        enter: 'animated fadeInDown'
        exit: 'animated fadeOutUp'
      message: 'Socket disconnected, please wait a seconds or reload this page'
    },
      element: 'body'
      type: 'danger'
      delay: 3000
      allow_dismiss: true
      placement:
        from: 'top'
        align: 'right'

  received: (data) ->
    # $('#orderTable').append data.item
    # $('#orderTable').remove data.item
    # $('#orderTable').children("tr").remove data.item
    # $("#orderTable").find('tr#table-order-id-'+data.order.id).remove();
    # $(table).find('tbody#orderTable').append()
    #console.log(data.item);
    #console.log(data.order.id);
    #console.log(data.action);
    Turbolinks.visit();
    
    