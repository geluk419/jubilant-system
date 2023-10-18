<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<!--     <link rel="icon" href="favicon.ico"> -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/master/light/assets/avatars/로고2.png">
    <title>취업딱대학교</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/feather.css">
    <link rel="stylesheet" href="/resources/master/light/css/select2.css">
    <link rel="stylesheet" href="/resources/master/light/css/dropzone.css">
    <link rel="stylesheet" href="/resources/master/light/css/uppy.min.css">
    <link rel="stylesheet" href="/resources/master/light/css/jquery.steps.css">
    <link rel="stylesheet" href="/resources/master/light/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/resources/master/light/css/quill.snow.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="/resources/master/light/css/app-dark.css" id="darkTheme" disabled>
    
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/weather-icons-master/css/weather-icons.css">
    <link rel="stylesheet" href="/resources/weather-icons-master/css/weather-icons-wind.css">

  </head>
  <body class="vertical  light  ">
    <!-- 마우스 효과를 위한 div -->
<!--     <div class="custom-cursor"></div> -->
    <div class="wrapper">
      <!-- /////////////////////// header 시작 ///	///////////////////////////// -->
      <tiles:insertAttribute name="header" />
      <!-- /////////////////////// header 끝 //////////////////////////////// -->
      
      <!-- /////////////////////// aside 시작 //////////////////////////////// -->
      <tiles:insertAttribute name="aside" />
      <!-- /////////////////////// aside 끝 //////////////////////////////// -->
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <!-- /////////////////////// body 시작 //////////////////////////////// -->
            <tiles:insertAttribute name="body" />
            <!-- /////////////////////// body 끝 //////////////////////////////// -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">수신 알림</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div  id="bjList" class="list-group list-group-flush my-n3">
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" onclick="back()">전체 확인</button>
              </div>
            </div>
          </div>
        </div>
        
      </main> <!-- main -->
    </div> <!-- .wrapper -->
    <script src="/resources/master/light/js/jquery.min.js"></script>
    <script src="/resources/master/light/js/popper.min.js"></script>
    <script src="/resources/master/light/js/moment.min.js"></script>
    <script src="/resources/master/light/js/bootstrap.min.js"></script>
    <script src="/resources/master/light/js/simplebar.min.js"></script>
    <script src='/resources/master/light/js/daterangepicker.js'></script>
    <script src='/resources/master/light/js/jquery.stickOnScroll.js'></script>
    <script src="/resources/master/light/js/tinycolor-min.js"></script>
    <script src="/resources/master/light/js/config.js"></script>
    <script src="/resources/master/light/js/d3.min.js"></script>
    <script src="/resources/master/light/js/topojson.min.js"></script>
    <script src="/resources/master/light/js/datamaps.all.min.js"></script>
    <script src="/resources/master/light/js/datamaps-zoomto.js"></script>
    <script src="/resources/master/light/js/datamaps.custom.js"></script>
    <script src="/resources/master/light/js/Chart.min.js"></script>
    <script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="/resources/master/light/js/gauge.min.js"></script>
    <script src="/resources/master/light/js/jquery.sparkline.min.js"></script>
    <script src="/resources/master/light/js/apexcharts.min.js"></script>
    <script src="/resources/master/light/js/apexcharts.custom.js"></script>
    <script src='/resources/master/light/js/jquery.mask.min.js'></script>
    <script src='/resources/master/light/js/select2.min.js'></script>
    <script src='/resources/master/light/js/jquery.steps.min.js'></script>
    <script src='/resources/master/light/js/jquery.validate.min.js'></script>
    <script src='/resources/master/light/js/jquery.timepicker.js'></script>
    <script src='/resources/master/light/js/dropzone.min.js'></script>
    <script src='/resources/master/light/js/uppy.min.js'></script>
    <script src='/resources/master/light/js/quill.min.js'></script>
    <script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [{'font': []}],
          [{'header': [1, 2, 3, 4, 5, 6, false]}],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [{'header': 1}, {'header': 2}],
          [{'list': 'ordered'},{'list': 'bullet'}],
          [{'script': 'sub'},{'script': 'super'}],
          [{'indent': '-1'},{'indent': '+1'}], // outdent/indent
          [{'direction': 'rtl'}], // text direction
          [{'color': []},
          {'background': []}], // dropdown with defaults from theme
          [{'align': []}],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
    <script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
    <script src="/resources/master/light/js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
	<!-- SweetAlert JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- chartjs JS -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <!-- 마우스 커서 효과 JS -->
  <script>
//       const customCursor = document.querySelector('.custom-cursor');

//       document.addEventListener('mousemove', (e) => {
//           // 마우스 커서의 위치로 동그라미 이동
//           customCursor.style.left = `\${e.clientX}px`;
//           customCursor.style.top = `\${e.clientY}px`;
//       });
	function back() {
		$("#kjBell").css("display","none");
	}
  </script>
	
    <!-- /////////////////////// footer 시작 //////////////////////////////// -->
      <tiles:insertAttribute name="footer" />
    <!-- /////////////////////// footer 끝 //////////////////////////////// -->
  </body>
</html>