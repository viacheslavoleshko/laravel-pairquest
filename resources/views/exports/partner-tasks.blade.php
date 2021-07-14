<table>
    <thead>
    <tr>
        <th style="width: 80px">Description</th>
        <th style="width: 20px">Gender</th>
    </tr>
    </thead>
    <tbody>
    @foreach($partner_tasks as $partner_task)
        <tr>
            <td>{{ $partner_task->description }}</td>
            <td>{{ $partner_task->gender->name }}</td>
        </tr>
    @endforeach
    </tbody>
</table>