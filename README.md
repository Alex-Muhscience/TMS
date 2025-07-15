# Task Management System (TMS)

A comprehensive web application for managing tasks, user accounts, and administrative functions.

## Features

- User authentication and authorization
- Admin and user role management
- Task creation and assignment
- **Email notifications** for assigned tasks
- Task status tracking
- Daily task reporting
- Password management
- Responsive Bootstrap-based UI

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 3
- **Backend**: PHP
- **Database**: MySQL
- **Server**: Apache (XAMPP)
- **Email**: PHPMailer with SMTP

## Installation

1. Ensure you have XAMPP installed and running
2. Clone this repository into your `htdocs` folder
3. Import the database schema from `Database/tms_db.sql` into MySQL
4. Configure database connection in the relevant PHP files (if needed)
5. Install dependencies: `composer install`
6. Configure email settings in `.env` file (see Configuration section)
7. Access the application via `http://localhost/tms`

## Docker Deployment

To deploy using Docker:

1. Ensure Docker and Docker Compose are installed
2. Copy `.env.example` to `.env` and configure:
   - Database credentials
   - Email settings
3. Build and start containers:

   ```bash
   docker-compose up -d --build
   ```

4. Access the application at `http://localhost:8000`
5. To stop containers:

   ```bash
   docker-compose down
   ```

### Notes

- The database will persist in a Docker volume
- First run may take time to initialize MySQL
- Check logs with `docker-compose logs`

## Configuration

The system requires the following:

- PHP 7.0 or higher
- MySQL 5.7 or higher
- Apache web server
- Browser with JavaScript enabled

### Email Configuration

1. Create `.env` file in project root with these variables:

```markdown
MAIL_USERNAME=your_email@gmail.com
MAIL_PASSWORD=your_password_or_app_password
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_ENCRYPTION=TLS
```

2. For Gmail:
   - Enable "Less secure apps" at <https://myaccount.google.com/lesssecureapps> OR
   - Create an App Password if using 2FA: <https://myaccount.google.com/apppasswords>

## File Structure

``` markdown
tms/
├── assets/          # Static assets (CSS, JS, images)
├── classes/         # PHP classes
├── Database/        # Database schema and scripts
├── include/         # Common includes (headers, footers)
├── vendor/          # Composer dependencies (PHPMailer)
├── .env             # Environment configuration
└── *.php            # Main application files
```

## Usage

1. Login using admin credentials (default: admin/admin123)
2. Navigate through the system using the sidebar
3. Create and assign tasks to users (emails will be sent automatically)
4. Monitor task progress through reports

## Troubleshooting Email Issues

1. Check PHP error logs for SMTP debug output
2. Verify `.env` file exists with correct permissions
3. Confirm email credentials are correct
4. Test with different SMTP providers if needed

## Screenshots

*(Screenshots would be added here after deployment)*

## License

*(License information would be added here)*
