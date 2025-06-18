defmodule Veasyt.Cldr do
  use Cldr,
    locales: ["it", "en"],
    default_locale: "it",
    gettext: VeasytWeb.Gettext,
    otp_app: :veasyt
end
