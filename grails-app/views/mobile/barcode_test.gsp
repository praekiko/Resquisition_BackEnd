<html>

        <head>
          <title>BarCode Test</title>

          <script type="text/javascript">

          function onscan(bardata) {
            alert( "Barcode result : " + bardata );
          }

          function startscan(barfield) {
            window.location = "readbarcode://"+barfield;
          }

          </script>
        </head>

        <body>

          <input id="barcodefield1" /><br />

          <input id="barcodefield2" /><br />

          <input onclick="startscan('barcodefield1')"
              type="button"
              value="Start scanning to field 1" />


          <input onclick="startscan('barcodefield2')"
          type="button"
          value="Start scanning to field 2" />
        </body>

      </html>
