require 'spec_helper'

describe SplitPDFJob do
  context 'split PDF job' do
    before(:each) do
      admin = create(:admin)
      assignment = create(:assignment)
      file = File.open('db/data/scanned_exams/midterm1.pdf')
      @exam_template = ExamTemplate.create_with_file(file.read, assignment_id: assignment.id, filename: 'midterm1.pdf')
      FileUtils.rm_rf(@exam_template.base_path)
    end

    context 'Multiple exam template made up of different page numbers in randomized order' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm46.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have zero QR scan errors' 


      it 'saves all the exam templates with page numbers that are error free in corresponding complete directory' 

    end

    context 'error-free exam template' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm27.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have pdf of each page in complete directory (error-free)' 


      it 'have zero QR scan errors' 

    end

    context 'made up of only 3 duplicate pages' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm21.pdf'
        SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have 1 pdf in incomplete directory' 


      it 'have 2 pdfs in error directory' 

    end

    context 'missing page' do
      context 'missing one page: Page 2' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm37.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have zero QR scan error' 


        it 'have pdf of every page except for 1 missing one in incomplete directory' 

      end

      context 'missing multiple pages: Page 2 and Page 5' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm25.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have zero QR scan error' 


        it 'have pdf of every page except for 2 missing ones in incomplete directory' 

      end

      context 'missing every page except for the first page' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm45.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have zero QR scan error' 


        it 'have pdf of the first page incomplete directory' 

      end
    end

    context 'pages are upside down' do
      context 'all pages upside down' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm26.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have as many QR scan errors as number of pages' 


        it 'generate error in each page' 

      end

      context 'page 2 and page 3 are upside down' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm28.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have 2 QR scan errors' 


        it 'have pdf of each page in incomplete directory excluding page 2 and page 3' 


        it 'have 2 pdfs in error directory' 

      end
    end

    context 'shuffled pages' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm29.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      # midterm29.pdf is supposed to be error-free but it generated an error for a page
      it 'have one QR scan error' 


      # midterm29.pdf is supposed to be in complete directory, but one page had an error
      it 'have pdf of each page in incomplete directory except for page 1' 

    end

    context 'scratched out' do
      context 'scratched out QR code in one page: Page 3' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm30.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have one QR scan error' 


        it 'have 1 pdf in error directory' 

      end

      context 'scratched out QR code in multiple pages: Page 3 and Page 8' do
        before(:each) do
          path = 'db/data/scanned_exams/midterm33.pdf'
          @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
        end

        it 'have two QR scan errors' 


        it 'have other pages that are error free in incomplete directory' 


        it 'have 2 pdfs in error directory' 

      end
    end

    context 'shuffled pages and missing page 1 and page 5' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm31.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have zero QR scan error' 


      it 'have pdf of every page except for 2 missing ones in incomplete directory' 

    end

    context 'only Page 1 and Page 2 are present Page 2 is upside down' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm34.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have one QR scan error' 


      it 'have Page 1 in incomplete directory' 


      it 'have 1 pdf in error directory' 

    end

    context 'Page 3 is upside down and QR code in Page 6 is scratched out' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm35.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have two QR scan errors' 


      it 'have other pages that are error free in incomplete directory' 


      it 'have 2 pdfs in error directory' 

    end

    context 'Page 1 and Page 2 are missing, QR code in Page 7 is scratched out, pages are shuffled' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm36.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have one QR scan error' 


      it 'have other pages that are error free in incomplete directory' 

    end

    context 'Page 3 and 5 are upside down, QR code in Page 1 and 2 is scratched out, pages are shuffled' do
      before(:each) do
        path = 'db/data/scanned_exams/midterm42.pdf'
        @split_pdf_log = SplitPDFJob.perform_now(@exam_template, path)
      end

      it 'have four QR scan errors' 


      it 'have other pages that are error free in incomplete directory' 


      it 'have 4 pdfs in error directory' 

    end
  end
end

