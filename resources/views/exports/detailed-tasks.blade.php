<table>
    <thead>
    <tr>
        <th>Description</th>
        <th>Custom Partner Task</th>
        <th>Location Type</th>
        <th>Preference</th>
        <th>User Level</th>
        <th>Gender</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    @foreach($detailed_tasks as $detailed_task)
        <tr>
            <td>{{ $detailed_task->description }}</td>
            <td>{{ $detailed_task->custom_partner_task }}</td>
            <td>{{ $detailed_task->location_type->name }}</td>
            <td>{{ $detailed_task->preference->description }}</td>
            <td>{{ $detailed_task->user_level->name }}</td>
            <td>{{ $detailed_task->gender->name }}</td>
            <td>{{ $detailed_task->image }}</td>
        </tr>
    @endforeach
    </tbody>
</table>