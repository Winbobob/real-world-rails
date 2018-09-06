describe 'My Academics teaching semesters UI', :testui => true do

  if ENV["UI_TEST"] && Settings.ui_selenium.layer != 'production'

    include ClassLogger

    begin

      driver = WebDriverUtils.launch_browser

      test_users = UserUtils.load_test_users
      testable_users = []
      test_output_heading = ['UID', 'Semester', 'Course Title', 'Listing Code', 'Cross-listings', 'Schedule Format', 'Primary?',
                             'Recurring Schedule', 'One-Time Schedule', 'Instructor']
      test_output = UserUtils.initialize_output_csv(self, test_output_heading)

      test_users.each do |user|
        if user['teaching']
          uid = user['uid'].to_s
          logger.info("UID is #{uid}")

          begin
            splash_page = CalCentralPages::SplashPage.new(driver)
            splash_page.load_page
            splash_page.basic_auth uid
            status_api_page = ApiMyStatusPage.new(driver)
            status_api_page.get_json(driver)
            student_api_page = ApiEdosStudentPage.new driver
            student_api_page.get_json driver

            if (status_api_page.is_faculty? || status_api_page.has_instructor_history? || student_api_page.affiliation_types.include?('INSTRUCTOR')) && status_api_page.has_academics_tab?
              academics_api_page = ApiMyAcademicsPageSemesters.new(driver)
              academics_api_page.get_json(driver)
              all_semesters = academics_api_page.all_teaching_semesters
              teaching_card = CalCentralPages::MyAcademicsTeachingCard.new(driver)
              teaching_card.load_page
              has_teaching_card = WebDriverUtils.verify_block { teaching_card.teaching_heading_element.when_visible WebDriverUtils.academics_timeout }

              if all_semesters.present?
                testable_users.push(uid)

                it("shows a Teaching card for UID #{uid}") { expect(has_teaching_card).to be true }

                all_semester_names = academics_api_page.semester_names(all_semesters)
                default_semesters = academics_api_page.default_semesters_in_ui(all_semesters)
                default_semester_names = academics_api_page.semester_names(default_semesters)
                current_semester = academics_api_page.current_semester(all_semesters)

                # MY ACADEMICS CLASSES CARD

                unless current_semester.nil? || status_api_page.is_student?
                  current_semester_name = academics_api_page.semester_name(current_semester)
                  classes_card = CalCentralPages::MyAcademicsClassesCard.new(driver)

                  api_current_courses = academics_api_page.semester_courses(current_semester)
                  api_current_listing_codes = academics_api_page.semester_listing_course_codes(current_semester)
                  api_current_course_titles = academics_api_page.course_titles(api_current_courses)

                  my_academics_semester_name = classes_card.teaching_semester_heading
                  my_academics_course_codes = classes_card.all_teaching_course_codes
                  my_academics_course_titles = classes_card.all_teaching_course_titles

                  it "shows the current semester class card on the landing page for UID #{uid}" 

                  it "shows the current semester course codes on the landing page class card for UID #{uid}" 

                  it "shows the current semester course titles on the landing page class card for UID #{uid}" 

                end

                # MY ACADEMICS TEACHING CARD

                shows_default_semesters = teaching_card.teaching_terms_visible?(default_semester_names)
                it "shows future, current, and most recent past teaching semesters by default for UID #{uid}" 

                show_more_button_visible = teaching_card.show_more_element.visible?
                if all_semesters.length > default_semesters.length
                  it "offers a 'Show More' button for UID #{uid}" 

                  teaching_card.show_more
                  shows_more_semesters = teaching_card.teaching_terms_visible?(all_semester_names)
                  it "can show all semesters for UID #{uid}" 

                else
                  it "offers no 'Show More' button for UID #{uid}" 

                end

                all_semesters.each do |semester|
                  if teaching_card.show_more_element.visible?
                    teaching_card.show_more
                  end
                  begin
                    semester_name = academics_api_page.semester_name(semester)
                    semester_courses = academics_api_page.semester_courses(semester)

                    teaching_card_course_codes = teaching_card.all_semester_course_codes(driver, semester_name)
                    teaching_card_course_titles = teaching_card.all_semester_course_titles(driver, semester_name)

                    api_course_codes = academics_api_page.semester_listing_course_codes(semester)
                    api_course_titles = academics_api_page.course_titles(semester_courses)

                    it "shows the course codes for #{semester_name} on the teaching card for UID #{uid}" 

                    it "shows the course titles for #{semester_name} on the teaching card for UID #{uid}" 


                    # SEMESTER PAGES

                    teaching_card.click_teaching_semester_link semester_name
                    semester_page = CalCentralPages::MyAcademicsClassesCard.new(driver)

                    api_semester_courses = academics_api_page.semester_courses(semester)
                    api_semester_listing_codes = academics_api_page.semester_listing_course_codes(semester)
                    api_semester_course_titles = academics_api_page.course_titles(api_semester_courses)

                    semester_page_course_codes = semester_page.all_teaching_course_codes
                    semester_page__course_titles = semester_page.all_teaching_course_titles

                    it "shows the course codes on the #{semester_name} semester page for UID #{uid}" 

                    it "shows the course titles on the #{semester_name} semester page for UID #{uid}" 


                    # CLASS PAGES

                    api_semester_courses.each do |course|

                      listing_codes = academics_api_page.course_listing_course_codes(course)
                      listing_codes.each do |course_code|

                        semester_page.click_class_link_by_text course_code
                        class_page = CalCentralPages::MyAcademicsClassPage.new(driver)
                        class_page.role_element.when_visible(WebDriverUtils.page_load_timeout)

                        api_course_title = academics_api_page.course_title(course)
                        api_sections = academics_api_page.sections_by_listing(course)
                        api_section_schedule_labels = academics_api_page.section_schedule_labels(api_sections)
                        api_section_schedules = academics_api_page.concatenated_schedules(api_sections)
                        api_section_instructor_labels = academics_api_page.sections_labels(api_sections)
                        api_section_instructors = academics_api_page.sections_instructor_names(api_sections)

                        class_page_course_title = class_page.course_title
                        class_page_cross_listings = class_page.all_cross_listings
                        class_page_section_labels = class_page.all_recurring_schedule_labels
                        class_page_section_schedules = class_page.all_teaching_section_schedules
                        class_page_section_instructors = class_page.all_section_instructors(driver, api_section_instructor_labels)

                        it "shows the course title on the #{semester_name} #{course_code} class page for UID #{uid}" 

                        if listing_codes.length > 1
                          it "shows the cross listings on the #{semester_name} #{course_code} class page for UID #{uid}" 

                        else
                          it "shows no cross listings on the #{semester_name} #{course_code} class page for UID #{uid}" 

                          has_cross_listing_heading = class_page.cross_listing_heading?
                          it "shows no cross listings heading on the #{semester_name} #{course_code} class page for UID #{uid}" 

                        end
                        it "shows the section labels on the #{semester_name} #{course_code} class page for UID #{uid}" 

                        it "shows the section schedules on the #{semester_name} #{course_code} class page for UID #{uid}" 

                        it "shows the section instructors on the #{semester_name} #{course_code} class page for UID #{uid}" 


                        api_sections.each do |section|
                          test_output_row = [uid, semester_name, api_course_title, course_code, listing_codes * "\r",
                                             academics_api_page.section_label(section), academics_api_page.primary_section?(section),
                                             academics_api_page.concatenated_schedules(academics_api_page.section_schedules_recurring section) * ' ',
                                             academics_api_page.concatenated_schedules(academics_api_page.section_schedules_one_time section) * ' ',
                                             academics_api_page.section_instructor_names(section) * "\r"]
                          UserUtils.add_csv_row(test_output, test_output_row)
                        end

                        class_page.back

                      end
                    end

                    semester_page.back

                  end
                end
              else

                it("shows no Teaching card for UID #{uid}") { expect(has_teaching_card).to be false }

              end
            end
          rescue => e
            logger.error e.message + "\n" + e.backtrace.join("\n ")
          end
        end
      end

      it 'has teaching information for at least one of the test UIDs' 


    rescue => e
      logger.error e.message + "\n" + e.backtrace.join("\n ")
    ensure
      WebDriverUtils.quit_browser(driver)
    end
  end
end

