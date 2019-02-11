import Html exposing (..)


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL
type Msg = Increment | Decrement | Sde
update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
    
    Sde ->
      model * 2
-- UPDATE

type Msg = Reset | ...

update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset -> ...
    ...


-- VIEW

view : Model -> Html Msg
view model =
  ...
