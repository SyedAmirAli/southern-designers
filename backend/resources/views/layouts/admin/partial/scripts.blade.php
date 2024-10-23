<script
  type="text/javascript"
  src="{{ asset('backend/js/plugin.js') }}"
></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script
  type="text/javascript"
  src="{{ asset('backend/js/script.js') }}"
></script>

<script type="text/javascript">
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });

  $(document).on("change", ".change-status", function (e) {
    e.preventDefault();
    let url = $(this).data("url");
    $.ajax({
      url: url,
      data: {
        _method: "GET",
        status: "true",
        name: $(this).attr("name")
      },
      success: (response) => {
        if (response.status == "success") {
          Swal.fire({
            width: "22rem",
            title: "Changed!",
            text: "Status Changed Successfully!",
            icon: "success",
            showConfirmButton: false,
            timer: 1500,
          });
        }
        if (response.status == "error") {
          Swal.fire({
            width: "22rem",
            title: "Failed!",
            text: "You don't have any Authority to do this action",
            icon: "error",
            showConfirmButton: false,
            timer: 1500,
          });
          $(".dataTable").DataTable().ajax.reload();
        }
      },
    });
  });

  $(document).on("click", "#cancelBtn", function (e) {
    e.preventDefault();
    $("#editForm").hide();
    $("#addForm").show();
  });

  $(document).on("click", ".link-delete", function (e) {
    e.preventDefault();
    let url = $(this).data("url");
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Yes, delete it!",
      cancelButtonText: "No, cancel!",
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: url,
          type: "POST",
          data: {
            _method: "DELETE",
          },
          success: function (response) {
            if (response.status == "success") {
              Swal.fire({
                width: "22rem",
                title: "Deleted!",
                text: response.status,
                icon: "success",
                showConfirmButton: false,
                timer: 1500,
              });
              $(".dataTable").DataTable().ajax.reload();
            }
            if (response.status == "error") {
              Swal.fire({
                width: "22rem",
                title: "Failed!",
                text: "You don't have any Authority to do this action",
                icon: "error",
                showConfirmButton: false,
                timer: 1500,
              });
            }
          },
        });
      } else result.dismiss === Swal.DismissReason.cancel;
    });
  });

  $("#selectAll").on("click", function (e) {
    if ($(this).is(":checked")) {
      $(".multi_checkbox").prop("checked", true);
    } else {
      $(".multi_checkbox").prop("checked", false);
    }
  });

  // multi delete row table
  function multiDelCheckbox(url, selectClass) {
    Swal.fire({
      width: "25rem",
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!",
    }).then((result) => {
      if (result.value) {
        let id = [];
        $("." + selectClass + ":checked").each(function () {
          id.push($(this).val());
        });
        if (id.length > 0) {
          $.ajax({
            url: url,
            type: "POST",
            data: {
              _method: "DELETE",
              id: id,
            },
            success: function (response) {
              if (response.status == "success") {
                Swal.fire({
                  width: "22rem",
                  title: "Deleted!",
                  text: response.val,
                  icon: "success",
                  showConfirmButton: false,
                  timer: 1500,
                });
              }
              if (response.status == "error") {
                Swal.fire({
                  width: "22rem",
                  title: "Failed!",
                  text: "You don't have any Authority to do this action",
                  icon: "error",
                  showConfirmButton: false,
                  timer: 1500,
                });
              }
              $("#selectAll").prop("checked", false);
              $("input[type=checkbox]").prop("checked", false);
              $(".dataTable").DataTable().ajax.reload();
            },
          });
        } else {
          Swal.fire({
            width: "22rem",
            title: "Error!",
            text: "Please select atleast one checkbox",
            icon: "error",
            showConfirmButton: false,
            timer: 1500,
          });
        }
      }
    });
  }

  $("#bulk_delete").on("click", function () {
    let url = $(this).data("url");
    let selectClass = "multi_checkbox";
    multiDelCheckbox(url, selectClass);
  });
</script>
