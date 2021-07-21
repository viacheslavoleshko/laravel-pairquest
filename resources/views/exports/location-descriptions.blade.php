<table>
    <thead>
    <tr>
        <th>Description</th>
        <th>Partner Description</th>
        <th>Location</th>
    </tr>
    </thead>
    <tbody>
    @foreach($location_descriptions as $location_description)
        <tr>
            <td>{{ $location_description->description }}</td>
            <td>{{ $location_description->partner_description }}</td>
            <td>{{ $location_description->location->name }}</td>
        </tr>
    @endforeach
    </tbody>
</table>