describe 'My Academics student semesters UI', :testui => true do

  if ENV["UI_TEST"] && Settings.ui_selenium.layer != 'production'

    include ClassLogger

    begin

      driver = WebDriverUtils.launch_browser

      test_users = UserUtils.load_test_users
      testable_users = []
      test_output_heading = ['UID', 'Semester', 'CCN', 'Course Code', 'Course Title', 'Section', 'Primary?',
                             'Grade Option', 'Grade', 'Units', 'Recurring Schedule', 'One-time Schedules',
                             'Wait List Position', 'Associated Sections?']
      test_output = UserUtils.initialize_output_csv(self, test_output_heading)

      test_users.each do |user|
        if user['enrollments']
          uid = user['uid'].to_s
          logger.info("UID is #{uid}")

          begin
            splash_page = CalCentralPages::SplashPage.new(driver)
            splash_page.load_page
            splash_page.basic_auth uid
            status_api_page = ApiMyStatusPage.new(driver)
            status_api_page.get_json(driver)
            if status_api_page.has_student_history? && status_api_page.has_academics_tab?
              academics_api_page = ApiMyAcademicsPageSemesters.new(driver)
              academics_api_page.get_json(driver)
              all_semesters = academics_api_page.all_student_semesters

              my_academics = CalCentralPages::MyAcademicsSemestersCard.new(driver)
              my_academics.load_page
              my_academics.page_heading_element.when_visible(timeout=WebDriverUtils.academics_timeout)

              # MY ACADEMICS PAGE SEMESTER CARDS

              if all_semesters.any?
                testable_users.push(uid)
                all_semester_names = academics_api_page.semester_names(all_semesters)
                default_semesters = academics_api_page.default_semesters_in_ui(all_semesters)
                default_semester_names = academics_api_page.semester_names(default_semesters)
                shows_default_semesters = my_academics.student_terms_visible?(default_semester_names)

                it "shows future, current, and most recent past semester by default for UID #{uid}" 


                show_more_button_visible = my_academics.show_more_element.visible?
                if all_semester_names.length > default_semester_names.length ||
                    (academics_api_page.past_semesters(all_semesters).any? && !academics_api_page.addl_credits.nil?)
                  it "offers a 'Show More' button for UID #{uid}" 

                  my_academics.show_more
                  shows_more_semesters = my_academics.student_terms_visible?(all_semester_names)
                  it "can show all semesters for UID #{uid}" 

                else
                  it "offers no 'Show More' button for UID #{uid}" 

                end

                all_semesters.each do |semester|
                  my_academics.show_more if my_academics.show_more_element.visible?
                  begin
                    semester_name = academics_api_page.semester_name(semester)
                    semester_courses = academics_api_page.semester_courses(semester)
                    wait_list_courses = academics_api_page.wait_list_courses(semester_courses)
                    enrolled_courses = (semester_courses - wait_list_courses)
                    semester_card_courses = academics_api_page.semester_card_courses(semester, enrolled_courses)

                    api_course_titles = academics_api_page.course_titles(semester_card_courses)

                    academics_page_course_codes = my_academics.prim_sec_course_codes(driver, semester_name)
                    academics_page_course_titles = my_academics.course_titles(driver, semester_name)
                    academics_page_course_units = my_academics.units(driver, semester_name)
                    academics_page_course_grades = my_academics.grades(driver, semester_name)

                    it "shows the course codes for #{semester_name} for UID #{uid}" 

                    it "shows the course titles for #{semester_name} for UID #{uid}" 

                    it "shows the course units for #{semester_name} for UID #{uid}" 

                    it "shows the grades for #{semester_name} for UID #{uid}" 


                    # SEMESTER PAGES

                    if academics_api_page.has_enrollment_data?(semester)
                      my_academics.click_student_semester_link semester_name
                      semester_page = CalCentralPages::MyAcademicsPage::MyAcademicsClassesCard.new(driver)
                      semester_page_enrolled_courses = academics_api_page.courses_by_primary_section(enrolled_courses)

                      # ENROLLED COURSES

                      semester_page_codes = semester_page.all_enrolled_course_codes
                      semester_page_titles = semester_page.all_enrolled_course_titles
                      semester_page_grade_options = semester_page.all_enrolled_grade_options
                      semester_page_units = semester_page.all_enrolled_units
                      semester_page_sections = semester_page.all_enrolled_sections

                      it "shows the enrolled course codes on the #{semester_name} semester page for UID #{uid}" 

                      it "shows the enrolled course titles on the #{semester_name} semester page for UID #{uid}" 

                      it "shows the enrolled course grade options on the #{semester_name} semester page for UID #{uid}" 

                      it "shows the enrolled course units on the #{semester_name} semester page for UID #{uid}" 

                      it "shows the enrolled section labels on the #{semester_name} semester page for UID #{uid}" 


                      if enrolled_courses.empty?
                        has_no_enrollment_msg = semester_page.no_enrollment_message?
                        it "shows a 'no enrollment' message on the #{semester_name} semester page for UID #{uid}" 

                      end

                      # WAIT LIST COURSES

                      if wait_list_courses.any?
                        api_wait_list_primary_sections = academics_api_page.wait_list_semester_sections wait_list_courses

                        sem_page_wait_list_codes = semester_page.all_waitlist_course_codes
                        sem_page_wait_list_titles = semester_page.all_waitlist_course_titles
                        sem_page_wait_list_sections = semester_page.all_waitlist_sections
                        sem_page_wait_list_positions = semester_page.all_waitlist_positions
                        sem_page_wait_list_sizes = semester_page.all_waitlist_class_sizes

                        it "shows the wait list course codes on the #{semester_name} semester page for UID #{uid}" 

                        it "shows the wait list course titles on the #{semester_name} semester page for UID #{uid}" 

                        it "shows the wait list sections on the #{semester_name} semester page for UID #{uid}" 

                        it "shows the wait list positions on the #{semester_name} semester page for UID #{uid}" 

                        it "shows the wait list sizes on the #{semester_name} semester page for UID #{uid}" 

                      end

                      # CLASS PAGES

                      semester_courses.each do |course|

                        begin

                          api_course_code = academics_api_page.course_code(course)
                          api_course_title = academics_api_page.course_title(course)

                          # Multiple primary sections in a course have one class page per primary section
                          if academics_api_page.multiple_primaries?(course)
                            logger.warn "Found multiple primary sections in #{semester_name} #{api_course_code}"
                            academics_api_page.course_primary_sections(course).each do |prim_section|

                              api_sections = academics_api_page.associated_sections(course, prim_section)
                              api_section_labels = academics_api_page.sections_labels(api_sections)
                              api_section_ccns = academics_api_page.sections_ccns(api_sections)
                              api_section_units = academics_api_page.sections_units(api_sections)
                              api_recurring_section_scheds = academics_api_page.concatenated_schedules(academics_api_page.course_schedules_recurring api_sections)
                              api_one_time_section_scheds = academics_api_page.concatenated_schedules(academics_api_page.course_schedules_one_time api_sections)
                              api_grade_options = academics_api_page.sections_grade_options(api_sections)

                              class_page_url = academics_api_page.section_url(prim_section)
                              semester_page.click_class_link_by_url class_page_url
                              class_page = CalCentralPages::MyAcademicsClassPage.new(driver)
                              class_page.class_info_heading_element.when_visible(WebDriverUtils.page_load_timeout)

                              class_page_breadcrumb = class_page.class_breadcrumb
                              class_page_course_title = class_page.course_title
                              class_page_course_role = class_page.role
                              class_page_section_labels = class_page.all_student_section_labels
                              class_page_section_ccns = class_page.all_student_section_ccns
                              class_page_section_units = class_page.all_section_units
                              class_page_grade_options = class_page.all_section_grade_options
                              class_page_recurring_scheds = class_page.all_recurring_schedules
                              class_page_one_time_scheds = class_page.all_one_time_schedules
                              class_page_course_instructors = class_page.all_section_instructors(driver, api_section_labels)

                              it "shows #{api_course_code} in the class page breadcrumb for #{semester_name} for UID #{uid}" 

                              it "shows the class title on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the student role on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the section labels on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                              it "shows the section instructors on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the enrolled section CCNs on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the section units on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the section grade options on the #{semester_name} #{api_course_code} multi-primary class page for UID #{uid}" 

                              it "shows the recurring section schedules on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                              it "shows the one-time section schedules on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 


                              api_sections.each do |api_section|
                                i = api_sections.index(api_section)
                                test_output_row = [uid, semester_name, api_section_ccns[i], api_course_code, api_course_title, api_section_labels[i],
                                                   academics_api_page.primary_section?(api_section), api_grade_options[i], nil, api_section_units[i],
                                                   academics_api_page.concatenated_schedules(academics_api_page.section_schedules_recurring api_section) * ' ',
                                                   academics_api_page.concatenated_schedules(academics_api_page.section_schedules_one_time api_section) * ' ',
                                                   academics_api_page.wait_list_position(api_section)]
                                UserUtils.add_csv_row(test_output, test_output_row)
                              end

                              class_page.back
                            end

                          # Single primary section in a course has a single class page
                          else
                            api_sections = academics_api_page.course_sections(course)
                            api_section_labels = academics_api_page.sections_labels(api_sections)
                            api_section_ccns = academics_api_page.sections_ccns(api_sections)
                            api_section_units = academics_api_page.sections_units(api_sections)
                            api_recurring_section_scheds = academics_api_page.concatenated_schedules(academics_api_page.course_schedules_recurring api_sections)
                            api_one_time_section_scheds = academics_api_page.concatenated_schedules(academics_api_page.course_schedules_one_time api_sections)
                            api_grade_options = academics_api_page.sections_grade_options(api_sections)

                            class_page_url = academics_api_page.course_url(course)
                            semester_page.click_class_link_by_url class_page_url
                            class_page = CalCentralPages::MyAcademicsClassPage.new(driver)
                            class_page.class_info_heading_element.when_visible(WebDriverUtils.page_load_timeout)

                            class_page_breadcrumb = class_page.class_breadcrumb
                            class_page_course_title = class_page.course_title
                            class_page_course_role = class_page.role
                            class_page_section_labels = class_page.all_student_section_labels
                            class_page_section_ccns = class_page.all_student_section_ccns
                            class_page_section_units = class_page.all_section_units
                            class_page_grade_options = class_page.all_section_grade_options
                            class_page_recurring_scheds = class_page.all_recurring_schedules
                            class_page_one_time_scheds = class_page.all_one_time_schedules
                            class_page_course_instructors = class_page.all_section_instructors(driver, api_section_labels)

                            it "shows #{api_course_code} in the class page breadcrumb for #{semester_name} for UID #{uid}" 

                            it "shows the class title on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the student role on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the section instructors on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the section labels on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the enrolled section CCNs on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the section units on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the section grade options on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the recurring section schedules on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 

                            it "shows the one-time section schedules on the #{semester_name} #{api_course_code} single primary class page for UID #{uid}" 


                            api_sections.each do |api_section|
                              i = api_sections.index(api_section)
                              test_output_row = [uid, semester_name, api_section_ccns[i], api_course_code, api_course_title, api_section_labels[i],
                                                 academics_api_page.primary_section?(api_section), api_grade_options[i], nil, api_section_units[i],
                                                 academics_api_page.concatenated_schedules(academics_api_page.section_schedules_recurring api_section) * ' ',
                                                 academics_api_page.concatenated_schedules(academics_api_page.section_schedules_one_time api_section) * ' ',
                                                 academics_api_page.wait_list_position(api_section), nil]
                              UserUtils.add_csv_row(test_output, test_output_row)
                            end

                            class_page.back

                          end
                        end
                      end

                      semester_page.back

                    else
                      logger.info "Found non-official enrollments for #{semester_name}"
                      semester_card_courses.each do |course|
                        i = semester_card_courses.index(course)
                        test_output_row = [uid, semester_name, nil, academics_api_page.semester_card_course_codes(all_semesters, semester, enrolled_courses)[i],
                                           api_course_titles[i], nil, nil, nil, nil, academics_api_page.semester_card_units(semester_courses)[i], nil, nil, nil]
                        UserUtils.add_csv_row(test_output, test_output_row)
                      end
                    end
                  end
                end
              end
            end
          rescue => e
            logger.error e.message + "\n" + e.backtrace.join("\n ")
          end
        end
      end

      it 'has enrollment information for at least one of the test UIDs' 


    rescue => e
      logger.error e.message + "\n" + e.backtrace.join("\n ")
    ensure
      WebDriverUtils.quit_browser(driver)
    end
  end
end
