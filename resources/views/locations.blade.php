@extends('layouts.app')

@section('title')
    <title>Add Locations</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        <h1>
            Додати локацію
        </h1>
    </div>
    <div class="main__inner">
        <div class="main__inner-box">
            <form method="POST" action="{{ route('locations.store', ['user' => Auth::user()->id]) }}">
                @csrf
                <div id="new_chq" class="form-input-item">
                    {{-- {{ dump(Auth::user()->locations->isEmpty()) }} --}}
                    @foreach (Auth::user()->locations as $location)
                    <div class="form-outline mb-4">
                        <input type="text" id="form2Example3" name="locations[]" class="form-control mb-4" value="{{ old('locations[]', $location->name) ?? null }}">
                    </div>
                    @endforeach
                </div>
                @if (Auth::user()->locations->isEmpty())
                <div class="form-outline mb-4">
                    <input type="text" id="form2Example4" name="locations[]" class="form-control mb-4">
                </div>
                @endif
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <button type="submit" class="btn btn-success mb-4 btn-centr">Далі</button>
            </form>
            <div class="btn-add-input" onclick="add()"></div>
        </div>
    </div>
</div>
@endsection

@section('javascript')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function add() {
            var new_chq_no = parseInt($('.total_chq').val()) + 1;
            var new_input = "<input type='text' class='form-control mb-4 new_" + new_chq_no + "' name='locations[]'>";
            $('#new_chq').append(new_input);
            $('#total_chq').val(new_chq_no)
        }
    </script>
@endsection
