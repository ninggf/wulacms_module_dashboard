define(function () {
	return {
		init    : function () {
			var me = this, type = $('[name=type]').on('click', function () {
				me.changeTo($(this).val());
			});
			this.changeTo(type.filter(':checked').val());
		},
		changeTo: function (type) {
			if (type == 'redis') {
				$('[name^=redis]').removeClass('ignore').closest('.form-group').show();
				$('[name^=memcached]').addClass('ignore').closest('.form-group').hide();
			} else {
				$('[name^=memcached]').removeClass('ignore').closest('.form-group').show();
				$('[name^=redis]').addClass('ignore').closest('.form-group').hide();
			}
		}
	};
});