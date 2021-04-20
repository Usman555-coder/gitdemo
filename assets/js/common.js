$(document).ready(function () {
  $('#sidebar-toggle').click(function () {
    $('#wrapper').toggleClass('active');
  });

  $('.search-dropdown .dropdown-menu').on('click', function (event) {
    event.stopPropagation();
  });

  // Details Tab save button
  $('.search-btn .save-btn, .modal-footer .save-btn').hide();

  $('.details .form-control, .common-modal-popup .modal-body .form-control').on(
    'focus',
    function () {
      $('.search-btn .save-btn, .modal-footer .save-btn').show();
    }
  );
  // Alert Success and Modal Popup
  $(
    '#details .alert-success, .common-modal-popup .modal-body .alert-success'
  ).hide();
  $('.search-btn .save-btn, .common-modal-popup .modal-footer .save-btn').on(
    'click',
    function (e) {
      e.preventDefault();
      $(
        '#details .alert-success, .common-modal-popup .modal-body .alert-success'
      ).show();
      setTimeout(function () {
        $(
          '#details .alert-success, .search-btn .save-btn, .common-modal-popup .modal-body .alert-success, .modal-footer .save-btn'
        ).hide();
      }, 3000);
    }
  );

  $('.selectAll').click(function (e) {
    var table = $(e.target).closest('table');
    $('td input:checkbox', table).attr('checked', e.target.checked);
  });
});

$('.alert-danger').hide();

$('.delete-option').on('click', function (e) {
  e.preventDefault();

  var alertMessage = $('.alert.alert-danger').show();
  setTimeout(function () {
    $('.alert-danger').hide();
  }, 3000);

  $('.common-table .table-checkbox tbody tr').each(function () {
    if ($(this).find('input:checkbox:checked').length > 0) {
      $(this).remove();
      $('.alert-danger').hide();
    } else {
      return alertMessage;
    }
  });
});
