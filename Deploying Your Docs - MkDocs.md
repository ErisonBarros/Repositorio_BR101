A basic guide to deploying your docs to various hosting providers

___

## GitHub Pages[](https://www.mkdocs.org/user-guide/deploying-your-docs/#github-pages "Permanent link")

If you host the source code for a project on [GitHub](https://github.com/), you can easily use [GitHub Pages](https://pages.github.com/) to host the documentation for your project. There are two basic types of GitHub Pages sites: [Project Pages](https://help.github.com/articles/user-organization-and-project-pages/#project-pages-sites) sites, and [User and Organization Pages](https://help.github.com/articles/user-organization-and-project-pages/#user-and-organization-pages-sites) sites. They are nearly identical but have some important differences, which require a different work flow when deploying.

### Project Pages[](https://www.mkdocs.org/user-guide/deploying-your-docs/#project-pages "Permanent link")

Project Pages sites are simpler as the site files get deployed to a branch within the project repository (`gh-pages` by default). After you `checkout` the primary working branch (usually `master`) of the git repository where you maintain the source documentation for your project, run the following command:

```
mkdocs gh-deploy
```

That's it! Behind the scenes, MkDocs will build your docs and use the [ghp-import](https://github.com/davisp/ghp-import) tool to commit them to the `gh-pages` branch and push the `gh-pages` branch to GitHub.

Use `mkdocs gh-deploy --help` to get a full list of options available for the `gh-deploy` command.

Be aware that you will not be able to review the built site before it is pushed to GitHub. Therefore, you may want to verify any changes you make to the docs beforehand by using the `build` or `serve` commands and reviewing the built files locally.

Warning

You should never edit files in your pages repository by hand if you're using the `gh-deploy` command because you will lose your work the next time you run the command.

### Organization and User Pages[](https://www.mkdocs.org/user-guide/deploying-your-docs/#organization-and-user-pages "Permanent link")

User and Organization Pages sites are not tied to a specific project, and the site files are deployed to the `master` branch in a dedicated repository named with the GitHub account name. Therefore, you need working copies of two repositories on our local system. For example, consider the following file structure:

```
my-project/
    mkdocs.yml
    docs/
orgname.github.io/
```

After making and verifying updates to your project you need to change directories to the `orgname.github.io` repository and call the `mkdocs gh-deploy` command from there:

```
cd ../orgname.github.io/
mkdocs gh-deploy --config-file ../my-project/mkdocs.yml --remote-branch master
```

Note that you need to explicitly point to the `mkdocs.yml` configuration file as it is no longer in the current working directory. You also need to inform the deploy script to commit to the `master` branch. You may override the default with the [remote\_branch](https://www.mkdocs.org/user-guide/configuration/#remote_branch) configuration setting, but if you forget to change directories before running the deploy script, it will commit to the `master` branch of your project, which you probably don't want.

### Custom Domains[](https://www.mkdocs.org/user-guide/deploying-your-docs/#custom-domains "Permanent link")

GitHub Pages includes support for using a [Custom Domain](https://help.github.com/articles/adding-or-removing-a-custom-domain-for-your-github-pages-site) for your site. In addition to the steps documented by GitHub, you need to take one additional step so that MkDocs will work with your custom domain. You need to add a `CNAME` file to the root of your [docs\_dir](https://www.mkdocs.org/user-guide/configuration/#docs_dir). The file must contain a single bare domain or subdomain on a single line (see MkDocs' own [CNAME file](https://github.com/mkdocs/mkdocs/blob/master/docs/CNAME) as an example). You may create the file manually, or use GitHub's web interface to set up the custom domain (under Settings / Custom Domain). If you use the web interface, GitHub will create the `CNAME` file for you and save it to the root of your "pages" branch. So that the file does not get removed the next time you deploy, you need to copy the file to your `docs_dir`. With the file properly included in your `docs_dir`, MkDocs will include the file in your built site and push it to your "pages" branch each time you run the `gh-deploy` command.

If you are having problems getting a custom domain to work, see GitHub's documentation on [Troubleshooting custom domains](https://help.github.com/articles/troubleshooting-custom-domains/).

## Read the Docs[](https://www.mkdocs.org/user-guide/deploying-your-docs/#read-the-docs "Permanent link")

[Read the Docs](https://readthedocs.org/) offers free documentation hosting. You can import your docs using any major version control system, including Mercurial, Git, Subversion, and Bazaar. Read the Docs supports MkDocs out-of-the-box. Follow the [instructions](https://docs.readthedocs.io/en/stable/intro/getting-started-with-mkdocs.html) on their site to arrange the files in your repository properly, create an account and point it at your publicly hosted repository. If properly configured, your documentation will update each time you push commits to your public repository.

Note

To benefit from all of the [features](https://docs.readthedocs.io/en/latest/features.html) offered by Read the Docs, you will need to use the [Read the Docs theme](https://www.mkdocs.org/user-guide/choosing-your-theme/#readthedocs) which ships with MkDocs. The various themes which may be referenced in Read the Docs' documentation are Sphinx specific themes and will not work with MkDocs.

## Other Providers[](https://www.mkdocs.org/user-guide/deploying-your-docs/#other-providers "Permanent link")

Any hosting provider which can serve static files can be used to serve documentation generated by MkDocs. While it would be impossible to document how to upload the docs to every hosting provider out there, the following guidelines should provide some general assistance.

When you build your site (using the `mkdocs build` command), all of the files are written to the directory assigned to the [site\_dir](https://www.mkdocs.org/user-guide/configuration/#site_dir) configuration option (defaults to `"site"`) in your `mkdocs.yaml` config file. Generally, you will simply need to copy the contents of that directory to the root directory of your hosting provider's server. Depending on your hosting provider's setup, you may need to use a graphical or command line [ftp](https://en.wikipedia.org/wiki/File_Transfer_Protocol), [ssh](https://en.wikipedia.org/wiki/Secure_Shell) or [scp](https://en.wikipedia.org/wiki/Secure_copy) client to transfer the files.

For example, a typical set of commands from the command line might look something like this:

```
mkdocs build
scp -r ./site user@host:/path/to/server/root
```

Of course, you will need to replace `user` with the username you have with your hosting provider and `host` with the appropriate domain name. Additionally, you will need to adjust the `/path/to/server/root` to match the configuration of your hosts' file system.

See your host's documentation for specifics. You will likely want to search their documentation for "ftp" or "uploading site".

## Local Files[](https://www.mkdocs.org/user-guide/deploying-your-docs/#local-files "Permanent link")

Rather than hosting your documentation on a server, you may instead distribute the files directly, which can then be viewed in a browser using the `file://` scheme.

Note that, due to the security settings of all modern browsers, some things will not work the same and some features may not work at all. In fact, a few settings will need to be customized in very specific ways.

-   [site\_url](https://www.mkdocs.org/user-guide/configuration/#site_url):
    
    The `site_url` must be set to an empty string, which instructs MkDocs to build your site so that it will work with the `file://` scheme.
    
    ```
    site_url: ""
    ```
    
-   [use\_directory\_urls](https://www.mkdocs.org/user-guide/configuration/#use_directory_urls):
    
    Set `use_directory_urls` to `false`. Otherwise, internal links between pages will not work properly.
    
    ```
    use_directory_urls: false
    ```
    
-   [search](https://www.mkdocs.org/user-guide/configuration/#search):
    
    You will need to either disable the search plugin, or use a third-party search plugin which is specifically designed to work with the `file://` scheme. To disable all plugins, set the `plugins` setting to an empty list.
    
    ```
    plugins: []
    ```
    
    If you have other plugins enabled, simply ensure that `search` is not included in the list.
    

When writing your documentation, it is imperative that all internal links use relative URLs as [documented](https://www.mkdocs.org/user-guide/writing-your-docs/#internal-links). Remember, each reader of your documentation will be using a different device and the files will likely be in a different location on that device.

If you expect your documentation to be viewed off-line, you may also need to be careful about which themes you choose. Many themes make use of CDNs for various support files, which require a live Internet connection. You will need to choose a theme which includes all support files directly in the theme.

When you build your site (using the `mkdocs build` command), all of the files are written to the directory assigned to the [site\_dir](https://www.mkdocs.org/user-guide/configuration/#site_dir) configuration option (defaults to `"site"`) in your `mkdocs.yaml` config file. Generally, you will simply need to copy the contents of that directory and distribute it to your readers. Alternatively, you may choose to use a third party tool to convert the HTML files to some other documentation format.

## 404 Pages[](https://www.mkdocs.org/user-guide/deploying-your-docs/#404-pages "Permanent link")

When MkDocs builds the documentation it will include a 404.html file in the [build directory](https://www.mkdocs.org/user-guide/configuration/#site_dir). This file will be automatically used when deploying to [GitHub](https://www.mkdocs.org/user-guide/deploying-your-docs/#github-pages) but only on a custom domain. Other web servers may be configured to use it but the feature won't always be available. See the documentation for your server of choice for more information.