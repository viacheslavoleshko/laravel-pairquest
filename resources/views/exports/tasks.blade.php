<table>
    <thead>
    <tr>
        <th>Description</th>
        <th>Partner Description</th>
        <th>Location Type</th>
        <th>Preference</th>
    </tr>
    </thead>
    <tbody>
    @foreach($tasks as $task)
        <tr>
            <td>{{ $task->description }}</td>
            <td>{{ $task->partner_description }}</td>
            <td>{{ $task->location_type->name }}</td>
            <td>{{ $task->preference->description }}</td>
        </tr>
    @endforeach
    </tbody>
</table>