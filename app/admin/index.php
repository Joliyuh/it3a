<?php

require_once '../../config/config.php';


requireRole('admin');

logActivity(
    $pdo,
    $_SESSION['user_id'],
    $_SESSION['user_email'],
    'view_activity_logs'
);

//  Get All Activity Logs

$stmt = $pdo->query("
    SELECT
        activity_log_id,
        user_id,
        user_email,
        activity_log_action,
        activity_log_status,
        activity_log_ip_address,
        activity_log_user_agent,
        activity_log_created_at

    FROM activity_logs

    ORDER BY activity_log_created_at DESC
");

$activities = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>Activity Logs</title>

</head>

<body>

    <h1>Activity Logs</h1>

    <p>
       <a href="../../auth/signout.php">Sign Out</a>
    </p>


    <table border="1">

        <thead>

            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Email</th>
                <th>Action</th>
                <th>Status</th>
                <th>IP Address</th>
                <th>User Agent</th>
                <th>Date & Time</th>
            </tr>

        </thead>


        <tbody>

            <?php foreach ($activities as $activity): ?>

                <tr>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_id']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['user_id']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['user_email']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_action']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_status']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_ip_address']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_user_agent']
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            $activity['activity_log_created_at']
                        ) ?>
                    </td>

                </tr>

            <?php endforeach; ?>

        </tbody>

    </table>

</body>

</html>