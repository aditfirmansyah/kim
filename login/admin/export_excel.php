<?php
date_default_timezone_set("Asia/Jakarta");
session_start();
if (!isset($_SESSION["npk"]) && !isset($_SESSION["akses"])) {
    echo "<script type='text/javascript'>alert('Anda Harus Login Terlebih Dahulu!');window.location.href = '../../index.php';</script>";
    exit;
}

$aks = $_SESSION["akses"];

if ($aks != "admin") {
    echo "<script type='text/javascript'>alert('Anda Tidak Memiliki Akses Admin!');window.location.href = '../../index.php';</script>";
    exit;
}
include('../config/functions.php');
my_constants();
xlscreation_direct();
die();
// header("Content-type: application/vnd-ms-excel");
// header("Content-Disposition: attachment; filename=hasil-ekspor-qc-executive-to-pako.xls");
// header("Pragma: no-cache");
// header("Expires: 0");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Favicons-->
    <link rel="icon" href="../../img/icons.png" sizes="32x32" />
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <style>
        .section {
            padding-top: 4vw;
            padding-bottom: 4vw;
        }

        .report td,
        .report th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            font-size: 13px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .danger {
            color: red;
            font-size: 16px;
        }

        .warning {
            color: black;
            font-size: 16px;
        }

        .sukses {
            color: green;
            font-size: 16px;
        }
    </style>
</head>

<body>

    <table id="data-table-simple" border="1" class="report section" cellspacing="0" style="width:100%;">
        <thead>
            <tr>
                <th colspan="17">
                    <h2>
                        CHECKSHEET REPORTING QC EXCUTIVE TO PAKO
                    </h2>
                </th>
            </tr>
            <tr>
                <th rowspan="2">NO</th>
                <th rowspan="2">INPUT DATE</th>
                <th rowspan="2">TYPE</th>
                <th rowspan="2">DEFECT</th>
                <th rowspan="2">PICTURE</th>
                <th rowspan="2">SIZE</th>
                <th rowspan="2">AREA</th>
                <th rowspan="2">SUB AREA</th>
                <th rowspan="2">SQUARE MARK</th>
                <th rowspan="2">INITIAL</th>
                <th rowspan="2">ROUND MARK</th>
                <th rowspan="2">INITIAL</th>
                <th colspan="4">JUDGE</th>
                <th>TC</th>
            </tr>
            <tr>
                <th>OK</th>
                <th class="yellow">Can Be Repaired</th>
                <th class="yellow">After Repair</th>
                <th>Reject</th>
                <th>Small Round Mark</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <?php
                $no = 1;
                $reportdetails = report_details(1);
                foreach ($reportdetails as $row) {
                    echo "<tr>";
                    echo "<td>" . $no . "</td>";
                    echo "<td>" . $row['input_date'] . "</td>";
                    echo "<td>" . $row['tipe'] . "</td>";
                    echo "<td>" . $row['defect'] . "</td>";
                    echo "<td><img src='../../img/picture_report/" . $row['picture'] . "' height='140' width='200' alt='picture'>
                                </td>";
                    echo "<td>" . $row['size'] . "</td>";
                    echo "<td>" . $row['area'] . "</td>";
                    echo "<td>" . $row['sub_area'] . "</td>";
                    echo "<td>" . $row['smd'] . "</td>";
                    echo "<td>" . $row['ism'] . "</td>";
                    echo "<td>" . $row['rmd'] . "</td>";
                    echo "<td>" . $row['irm'] . "</td>";
                    if ($row['judge'] == 'OK') {
                        $ok = 'V';
                    } else {
                        $ok = '';
                    }
                    echo "<td>" . $ok . "</td>";
                    if ($row['judge'] == 'REPAIR') {
                        $rp = 'V';
                    } else {
                        $rp = '';
                    }
                    echo "<td>" . $rp . "</td>";
                    echo "<td>" . $row['after_repair'] . "</td>";
                    if ($row['judge'] == 'REJECT') {
                        $reject = 'V';
                    } else {
                        $reject = '';
                    }
                    echo "<td>" . $reject  . "</td>";
                    echo "<td>" . $row['isk'] . "</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
            </tr>
        </tbody>
    </table>
</body>

</html>