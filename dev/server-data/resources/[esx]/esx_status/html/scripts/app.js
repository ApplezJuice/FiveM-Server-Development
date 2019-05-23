(function () {
    let status = [];

    let renderStatus = function () {

        $('#status_list').html('');


            if (!status[0].visible) {

            let statusDiv = $(
                '<div class="status">' +
                    '<div class="status_inner">' +
                        '<div class="status_val"></div>' +
                    '</div>' +
                '</div>');

            statusDiv.find('.status_inner')
                .css({ 'border': '1px solid ' + status[0].color })
                ;

            statusDiv.find('.status_val')
                .css({
                    'background-color': status[0].color,
                    'width': (status[0].val / 10000) + '%'
                })
                ;

            $('#status_list').append(statusDiv);
        }

            if (!status[1].visible) {

            let statusDiv2 = $(
                '<div class="status">' +
                    '<div class="status_inner">' +
                        '<div class="status_val"></div>' +
                    '</div>' +
                '</div>');

            statusDiv2.find('.status_inner')
                .css({ 'border': '1px solid ' + status[1].color })
                ;

            statusDiv2.find('.status_val')
                .css({
                    'background-color': status[1].color,
                    'width': (status[1].val / 10000) + '%'
                })
                ;

            $('#status_list2').append(statusDiv2);
        }
        

    };

	window.onData = function (data) {
		if (data.update) {
			status.length = 0;

			for (let i = 0; i < data.status.length; i++) {
				status.push(data.status[i]);
			}

			renderStatus();
		}

		if (data.setDisplay) {
			$('#status_list').css({ 'opacity': data.display });
		}
	};

	window.onload = function (e) {
		window.addEventListener('message', function (event) {
			onData(event.data);
		});
	};

})();
