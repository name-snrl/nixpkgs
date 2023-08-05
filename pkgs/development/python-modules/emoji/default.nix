{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "emoji";
  version = "2.7.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "carpedm20";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-HxEQqWG0a96PQ0bNQsIyTSEK0G21WojgoAyaWLMmjyE=";
  };

  nativeCheckInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    "test_emojize_name_only"
  ];

  pythonImportsCheck = [
    "emoji"
  ];

  meta = with lib; {
    description = "Emoji for Python";
    homepage = "https://github.com/carpedm20/emoji/";
    changelog = "https://github.com/carpedm20/emoji/blob/v${version}/CHANGES.md";
    license = licenses.bsd3;
    maintainers = with maintainers; [ joachifm ];
  };
}
