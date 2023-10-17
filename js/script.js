$(document).ready(function() {
    $('#order-form').submit(function (e) {
        e.preventDefault();
        var values = $(this).serialize();

        $.ajax({
            type: "POST",
            url: './src/backend.php',
            data: values,
            success: function (res) {
                let html = '';
                switch (res.status)
                {
                    case 'success':
                        let address = '';
                        address += 'Улица ' + res.data.street;
                        address += ', дом ' + res.data.home;
                        address += ', корпус ' + res.data.part;
                        address += ', квартира ' + res.data.appt;
                        address += ', этаж ' + res.data.floor;
                        html = 'Спасибо, ваш заказ будет доставлен по адресу: ' + address + "\n";
                        html += 'Номер вашего заказа: ' + res.data.id + "\n";
                        html += 'Это ваш ' + res.data.orders_num + '-й заказ!';
                        break;
                    case 'fields_validate':
                    case 'fields_required':
                        res.data.forEach(function (item) {
                            html += item + "\n";
                        });
                        break;
                    case 'undefined':
                        html += 'Неизвестный статус ответа.';
                        break;
                }
                alert(html);
            }
        });
    });
});