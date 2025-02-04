<p align="center">
  <img height="100" src="https://pulzestrapistorageweu.blob.core.windows.net/public/assets/Frame_164_3303e85f0c.png" alt="Qdrant">
</p>

<p align="center">
    <b>Sanity checks for RenderFlow</b>
</p>

RenderFlow is a network rendering and automation tool for 3D artist.

This repository contains the scripts that are used to detect various errors in 3ds Max, Blender, Cinema 4D and other products before submitting a job for network rendering.

You can read more and try RenderFlow [here](https://www.pulze.io/products/render-flow).

## Getting Started
For 3ds Max the `main.ms` contains all the core logic. Functions starting with `check_` are the checks and functions starting with `fix_` are the fixes. Check function will always return a boolean value, `true` if the check passes and `false` if the check fails. The fix function (where available) will attempt to fix the issue, usually by updating a simple value or it tries to help the user by opening a certain dialog, or selecting the required object.

## Naming Convention

The naming convention for the checks is as follows:

```
-- MaxScript
fn check_<host>_<category>_<name>= 
(
    ...
)
```

## Contributing
If you have any suggestions or improvements, please feel free to submit a pull request or open an issue. We are also happy to receive feedback and improve the exsiting checks. Please note that the primary aim of this project is to serve the needs of RenderFlow users. As a result, very unique and domain-specific checks may not be included.

## Contact
If you have any questions or need help, please contact us at [support@pulze.io](mailto:support@pulze.io).

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.