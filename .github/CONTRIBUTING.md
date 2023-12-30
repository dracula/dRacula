## How to Contribute
Contributions are welcome!

1. [Fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the repo

1. Install the [`pre-commit` hooks](https://pre-commit.com/#install)

1. Create a new branch
    ```bash
    git checkout -b my-branch
    ```

1. Code!

1. Ensure all [`testthat`](https://testthat.r-lib.org/) tests pass
    ```R
    devtools::test()
    ```

    > Note that on first run a directory named `tests/testthat/_snaps` will be created and some tests will have a `WARN` result. This is okay! The next run will (hopefully) pass now that {[vdiffr](https://cran.r-project.org/web/packages/vdiffr/index.html)} has created snapshots for comparison.

1. Submit a PR
