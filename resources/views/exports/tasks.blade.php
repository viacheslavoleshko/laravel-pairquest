<table>
    <thead>
    <tr>
        <th style="width: 50px">Name</th>
        <th style="width: 20px">Preference</th>
        <th style="width: 20px">Duration</th>
        <th style="width: 20px">User Level</th>
        <th>Is Partner Task</th>
        <th style="width: 80px">Description</th>
        <th>Is Accessories</th>
        <th style="width: 20px">Gender</th>
        <th style="width: 20px">Image</th>
    </tr>
    </thead>
    <tbody>
    @foreach($tasks as $task)
        <tr>
            <td>{{ $task->name }}</td>
            <td>{{ $task->preference->description }}</td>
            <td>{{ $task->duration->name }}</td>
            <td>{{ $task->user_level->name }}</td>
            <td>{{ $task->is_partner_task }}</td>
            <td>{{ $task->description }}</td>
            <td>{{ $task->is_accessories }}</td>
            <td>{{ $task->gender->name }}</td>
            <td>{{ $task->image }}</td>
        </tr>
    @endforeach
    </tbody>
</table>